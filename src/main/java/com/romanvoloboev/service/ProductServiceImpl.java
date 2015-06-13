package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.dto.ReviewDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.*;
import com.romanvoloboev.repository.BookingItemRepository;
import com.romanvoloboev.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validation;
import javax.validation.Validator;
import java.text.ParseException;
import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired private ProductRepository productRepository;
    @Autowired private BrandServiceImpl brandService;
    @Autowired private SubcategoryServiceImpl subcategoryService;
    @Autowired private ImageServiceImpl imageService;
    @Autowired private ReviewService reviewService;
    @Autowired private BookingItemRepository bookingItemRepository;
    @Autowired private CustomerService customerService;

    @Transactional
    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Transactional
    @Override
    public void delete(Integer id) throws Exception {
        productRepository.delete(id);
    }

    @Override
    public boolean exists(Integer id) {
        return productRepository.exists(id);
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
                        productDTO.getCode(), productDTO.getPrice() , true, productDTO.getPromotionPrice(),
                        formatStringToDate(productDTO.getPromotionStart()), formatStringToDate(productDTO.getPromotionEnd()),
                        hasPromotion(productDTO.getPromotionStart(), productDTO.getPromotionEnd()), 0.0, productDTO.getMaterial(),
                        productDTO.getWidth(), productDTO.getHeight(), productDTO.getLength(), brand, subcategory, images, null);
            } else {
                product = selectModel(productDTO.getId());
                product = new Product(productDTO.getId(), productDTO.getName(), productDTO.getDescription(), product.getDate(),
                        productDTO.getQuantity(), productDTO.getCode(), productDTO.getPrice(), product.isActive(),
                        productDTO.getPromotionPrice(), formatStringToDate(productDTO.getPromotionStart()),
                        formatStringToDate(productDTO.getPromotionEnd()), hasPromotion(productDTO.getPromotionStart(),
                        productDTO.getPromotionEnd()), product.getRating(), productDTO.getMaterial(), productDTO.getWidth(),
                        productDTO.getHeight(), productDTO.getLength(), brand, subcategory, images, product.getReviews());
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
    public Product selectModel(Integer id) {
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
    public List<ProductDTO> searchBy(String name, Double priceStart, Double priceEnd, int status) throws Exception {
        boolean productStatus = true;
        if (status == 0) productStatus = false;
        if (priceEnd == 0) priceEnd = Double.MAX_VALUE;
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
    public List<Product> selectModels(String name, Double priceStart, Double priceEnd, boolean status) throws Exception {
        return productRepository.getByNameContainingAndPriceBetweenAndActive(name, priceStart, priceEnd, status);
    }

    @Transactional(readOnly = true)
    @Override
    public ProductDTO selectDTO(Integer id, boolean forEditing) {
        Product product;
        if (forEditing) {
            product = productRepository.getOne(id);
        } else {
            product = productRepository.getByIdAndActiveTrue(id);
        }
        if (product == null) return null;

        long reviewsCount = reviewService.selectActiveProductReviewsCount(id);
        List<Review> reviews = reviewService.selectActiveProductReviews(id);
        Subcategory subcategory = product.getSubcategory();
        Category category = product.getSubcategory().getCategory();

        return new ProductDTO(product.getId(), product.getName(), product.getDescription(), product.getQuantity(), product.getCode(),
                product.getPrice(), product.isPromotion(), product.getPromotionPrice(), formatDateToString(product.getPromotionStart()),
                formatDateToString(product.getPromotionEnd()), product.getRating(), reviewsCount, product.getMaterial(),
                product.getWidth(), product.getHeight(), product.getLength(), product.getBrand().getId(), product.getBrand().getName(),
                product.getBrand().getCountry(), category.getId(), subcategory.getId(), category.getName(), subcategory.getName(),
                selectImages(product.getImages()), selectReviewsDTO(reviews));
    }

    @Transactional
    private List<ReviewDTO> selectReviewsDTO(List<Review> reviews) {
        List<ReviewDTO> reviewDTO = new ArrayList<>();
        if (reviews != null) {
            for (Review review:reviews) {
                reviewDTO.add(new ReviewDTO(review.getComment(), formatDateToString(review.getDate()), review.getCustomer().getName(), review.getRating()));
            }
        }
        return reviewDTO;
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
    @Override
    public List<SimpleDTO> selectSimpleDTOsByName(String name) {
        List<SimpleDTO> simpleDTOs = new ArrayList<>();
        List<Product> products = selectModelsByName(name);
        if (products != null) {
            for (Product product:products) {
                simpleDTOs.add(new SimpleDTO(product.getId(), product.getName()));
            }
        }
        return simpleDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public SimpleDTO selectDTODetailById(Integer id) {
        Product product = selectModel(id);
        return new SimpleDTO(product.getId(), product.getName(), product.getPrice());
    }

    /**
     * Method using for selecting products in subcategory and sort it by chosen order type.
     */
    @Transactional
    @Override
    public List<ProductDTO> selectDTOsBySubcategorySortBy(Integer id, String sortType) {
        List<Product> products = selectModelsBySubcategorySortBy(id, sortType);
        List<ProductDTO> dtos = new ArrayList<>();
        if (products != null) {
            for (Product product:products) {
                dtos.add(new ProductDTO(product.getId(), product.getName(), product.getDescription(), product.getPrice(),
                        product.isPromotion(), product.getPromotionPrice(), product.getRating(), selectImages(product.getImages())));
            }
        }
        return dtos;
    }

    @Transactional
    @Override
    public List<Product> selectModelsBySubcategory(Integer id) {
        return productRepository.getBySubcategoryId(id);
    }

    @Transactional
    @Override
    public List<ProductDTO> selectSimilarDTO(Integer subcategory, Integer currentProduct) {
        List<Product> products = productRepository.getFirst5BySubcategoryIdAndIdNotOrderByRatingDesc(subcategory, currentProduct);
        List<ProductDTO> productDTOs = new ArrayList<>();
        if (products != null) {
            productDTOs = new ArrayList<>();
            for (Product product:products) {
                productDTOs.add(new ProductDTO(product.getId(), product.getName(), product.getPrice(), product.isPromotion(),
                        product.getPromotionPrice(), product.getRating(), selectImages(product.getImages())));
            }
        }
        return productDTOs;
    }

    private List<Product> selectModelsBySubcategorySortBy(Integer id, String sortType) {
        switch (sortType) {
            case "cheap": return productRepository.getByActiveTrueAndSubcategoryIdOrderByPriceAsc(id);
            case "expensive": return productRepository.getByActiveTrueAndSubcategoryIdOrderByPriceDesc(id);
            case "novelty": return productRepository.getByActiveTrueAndSubcategoryIdOrderByDateDesc(id);
            case "rating": return productRepository.getByActiveTrueAndSubcategoryIdOrderByRatingDesc(id);
            default: return productRepository.getByActiveTrueAndSubcategoryIdOrderByRatingDesc(id);
        }
    }

    private List<Product> selectModelsByName(String name) {
        return productRepository.getByNameStartingWith(name);
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

    public long[] selectImages(List<Image> images) {
        long[] ids = new long[0];
        if (images != null) {
            ids = new long[images.size()];
            int i = 0;
            for (Image image:images) {
                ids[i++] = image.getId();
            }
        }
        return ids;
    }

    /**
     * Returns products DTO for main page by some search criteria
     * @param criteriaType 1 - popular, 2 - with promo, 3 - by novelty
     */
    @Transactional
    @Override
    public List<ProductDTO> selectDTOsForMainPage(byte criteriaType) {
        List<Product> products = null;
        List<ProductDTO> productDTOs = new ArrayList<>();
        switch (criteriaType) {
            case 1: {
                products = bookingItemRepository.getPopularTop10Products(new PageRequest(0, 10));
                break;
            }
            case 2: {
                products = productRepository.getByActiveTrueAndPromotionTrue(new PageRequest(0, 10));
                break;
            }
            case 3: {
                products = productRepository.getByActiveTrueOrderByDateDesc(new PageRequest(0, 12));
                break;
            }
        }
        if (products != null) {
            for (Product product:products) {
                productDTOs.add(new ProductDTO(product.getId(), product.getName(), product.getDescription(), product.getPrice(),
                        product.isPromotion(), product.getPromotionPrice(), product.getRating(), selectImages(product.getImages())));
            }
        }
        return productDTOs;
    }

    @Transactional
    @Override
    public Map<String, String> addProductToWishList(int id) {
        Map<String, String> response = new HashMap<>();
        if (productRepository.exists(id)) {
            Product product = selectModel(id);
            Customer customer = customerService.selectAuth();
            List<Product> wishes = customer.getWishes();
            if (wishes == null) wishes = new ArrayList<>();
            wishes.add(product);
            customer.setWishes(wishes);
            response.put("status", "ok");
        } else {
            response.put("status", "No product was found");
        }
        return response;
    }

    @Transactional
    @Override
    public Map<String, String> removeProductFromWishList(int id) {
        Map<String, String> response = new HashMap<>();
        if (productRepository.exists(id)) {
            Customer customer = customerService.selectAuth();
            List<Product> wishes = customer.getWishes();
            if (wishes == null) {
                response.put("status", "No wishes for customer was found");
                return response;
            }
            boolean wasFound = false;
            for (Product wish:wishes) {
                if (wish.getId() == id) {
                    wasFound = true;
                    wishes.remove(wish);
                    response.put("status", "ok");
                    break;
                }
            }
            if (!wasFound) response.put("status", "No such wish was found in customer wishes");
            return response;
        } else {
            response.put("status", "There is no such product");
            return response;
        }
    }

    @Transactional
    @Override
    public List<ProductDTO> selectCustomerWishlist() {
        Customer customer = customerService.selectAuth();
        List<ProductDTO> dtos = new ArrayList<>();
        List<Product> wishes = customer.getWishes();
        if (wishes != null) {
            for (Product p:wishes) {
                if (p.isActive()) {
                    dtos.add(new ProductDTO(p.getId(), p.getName(), p.getPrice(), p.isPromotion(),
                            p.getPromotionPrice(), selectImages(p.getImages())));
                }
            }
        }
        return dtos;
    }
}
