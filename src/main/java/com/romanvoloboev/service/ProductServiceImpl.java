package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.model.Brand;
import com.romanvoloboev.model.Image;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.model.Subcategory;
import com.romanvoloboev.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class ProductServiceImpl implements ProductService {
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁa-zA-Z0-9 ]+$";

    @Autowired private ProductRepository productRepository;
    @Autowired private BrandServiceImpl brandService;
    @Autowired private SubcategoryServiceImpl subcategoryService;
    @Autowired private ImageServiceImpl imageService;

    @Transactional
    @Override
    public void save(Product product) throws Exception {
        productRepository.save(product);
    }

    @Transactional
    @Override
    public void delete(Integer id) throws Exception {
        productRepository.delete(id);
    }

    @Transactional
    @Override
    public void save(ProductDTO productDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(productDTO, validator)) {
            Product product;
            Brand brand = brandService.selectModel(productDTO.getBrand());
            Subcategory subcategory = subcategoryService.selectModel(productDTO.getSubcategory());
            List<Image> images = selectImages(productDTO.getImages());
            if (productDTO.getId() == 0) {
                product = new Product(productDTO.getName(), productDTO.getDescription(), new Date(), productDTO.getQuantity(),
                        productDTO.getCode(), productDTO.getPrice(), true, productDTO.getPromotionPrice(),
                        formatStringToDate(productDTO.getPromotionStart()), formatStringToDate(productDTO.getPromotionEnd()),
                        hasPromotion(productDTO.getPromotionStart(), productDTO.getPromotionEnd()), 0.0, productDTO.getMaterial(),
                        productDTO.getWidth(), productDTO.getHeight(), productDTO.getLength(), brand, subcategory, images, null);
            } else {
                product = selectModel(productDTO.getId());
                product = new Product(productDTO.getId(), productDTO.getName(), productDTO.getDescription(), product.getDate(),
                        productDTO.getQuantity(), productDTO.getCode(), productDTO.getPrice(), product.isActive(), productDTO.getPromotionPrice(),
                        formatStringToDate(productDTO.getPromotionStart()), formatStringToDate(productDTO.getPromotionEnd()),
                        hasPromotion(productDTO.getPromotionStart(), productDTO.getPromotionEnd()), product.getRating(),
                        productDTO.getMaterial(), productDTO.getWidth(), productDTO.getHeight(), productDTO.getLength(),
                        brand, subcategory, images, product.getReviews());
            }
            save(product);
        }
    }


    public boolean hasPromotion(String start, String end) {
        if (start != null && end != null) {
            Date dateStart;
            Date dateEnd;
            try {
                dateStart = formatStringToDate(start);
                dateEnd = formatStringToDate(end);
            } catch (ParseException e) {
                return false;
            }
            Date curDate = new Date();
            if (curDate.after(dateStart) && curDate.before(dateEnd)) {
                return true;
            }
        }
        return false;
    }

    @Transactional(readOnly = true)
    @Override
    public Product selectModel(Integer id) throws Exception {
        return productRepository.getOne(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<ProductDTO> selectDTOs() throws Exception {
        List<ProductDTO> productDTOs = null;
        List<Product> products = selectModels();
        if (products != null) {
            productDTOs = new ArrayList<>();
            for (Product product:products) {
                productDTOs.add(new ProductDTO(product.getId(), product.getName(), product.getPrice(), product.getPromotionPrice(),
                        product.getQuantity(), selectImages(product.getImages()), product.isActive(), product.isPromotion()));
            }
        }
        return productDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<Product> selectModels() throws Exception {
        return productRepository.getAllOrderByNameAsc();
    }

    @Transactional
    @Override
    public List<ProductDTO> searchBy(String name, Float priceStart, Float priceEnd, int status) throws Exception {
        boolean productStatus = true;
        if (status == 0) productStatus = false;
        if (priceEnd == 0) priceEnd = Float.MAX_VALUE;
        List<Product> products = selectModels(name, priceStart, priceEnd, productStatus);
        List<ProductDTO> productDTOs = null;
        if (products != null) {
            productDTOs = new ArrayList<>();
            for (Product product:products) {
                productDTOs.add(new ProductDTO(product.getId(), product.getName(), product.getPrice(), product.getPromotionPrice(),
                        product.getQuantity(), selectImages(product.getImages()), product.isActive(), product.isPromotion()));
            }
        }
        return productDTOs;
    }

    @Transactional
    @Override
    public List<Product> selectModels(String name, Float priceStart, Float priceEnd, boolean status) throws Exception {
        return productRepository.getByNameContainingAndPriceBetweenAndActive(name, priceStart, priceEnd, status);
    }

    @Transactional(readOnly = true)
    @Override
    public ProductDTO selectDTO(Integer id) throws Exception {
        Product product = selectModel(id);
        if (product == null) throw new NullPointerException();
        return new ProductDTO(product.getId(), product.getName(), product.getDescription(), product.getQuantity(),
                product.getCode(), product.getPrice(), product.isPromotion(), product.getPromotionPrice(), formatDateToString(product.getPromotionStart()),
                formatDateToString(product.getPromotionEnd()), product.getMaterial(), product.getWidth(), product.getHeight(),
                product.getLength(), product.getBrand().getId(), product.getBrand().getName(), product.getSubcategory().getId(),
                product.getSubcategory().getName(), selectImages(product.getImages()));
    }

    @Transactional
    @Override
    public void changeProductStatus(Integer id) throws Exception {
        Product product = selectModel(id);
        if (product == null) throw new NullPointerException("No such product");
        if (product.isActive()) {
            product.setActive(false);
        } else {
            product.setActive(true);
        }
        save(product);
    }

    @Transactional(readOnly = true)
    private List<Image> selectImages(long[] images) throws Exception {
        List<Image> imageList = new ArrayList<>();
        for (long id:images) {
            Image image = imageService.selectModel(id);
            if (image != null) {
                imageList.add(image);
            }
        }
        return imageList;
    }

    @Transactional(readOnly = true)
    private long[] selectImages(List<Image> images) throws Exception {
        long[] ids = new long[images.size()];
        int i = 0;
        for (Image image:images) {
            if (image != null) {
                ids[i++] = image.getId();
            }
        }
        return ids;
    }

    private String formatDateToString(Date date) throws ParseException {
        if (date == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        return dateFormat.format(date);
    }

    private Date formatStringToDate(String date) throws ParseException{
        if (date == null) return null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        return dateFormat.parse(date);
    }

    private boolean validate(Object object, Validator validator) throws ValidationException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);

        if (constraintViolations.size() > 0){
            StringBuilder errorString = new StringBuilder();
            for (ConstraintViolation<Object> cv : constraintViolations){
                errorString.append(String.format("Format error in property: [%s], value: [%s], message: [%s]",
                        cv.getPropertyPath(), cv.getInvalidValue(), cv.getMessage()));
            }
            throw new ValidationException(errorString.toString());
        }
        return true;
    }
}
