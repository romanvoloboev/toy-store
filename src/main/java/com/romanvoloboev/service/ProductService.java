package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.dto.ReviewDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Image;
import com.romanvoloboev.model.Product;

import javax.validation.ConstraintViolation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

public interface ProductService {

    default String formatDateToString(Date date) {
        if (date == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        return dateFormat.format(date);
    }

    default Date formatStringToDate(String date) throws ParseException{
        if (date == null) return null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        return dateFormat.parse(date);
    }

    default boolean validate(Object object, Validator validator) throws ValidationException {
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

    void save(ProductDTO productDTO) throws Exception;
    void save(Product product);
    void delete(Integer id) throws Exception;
    boolean exists(Integer id);
    Product selectModel(Integer id);
    List<ProductDTO> selectDTOs() throws Exception;
    List<Product> selectModels() throws Exception;
    List<ProductDTO> searchBy(String name, Double priceStart, Double priceEnd, int status) throws Exception;
    List<Product> selectModels(String name, Double priceStart, Double priceEnd, boolean status) throws Exception;
    ProductDTO selectDTO(Integer id, boolean forEditing);
    void changeProductStatus(Integer id) throws Exception;
    List<SimpleDTO> selectSimpleDTOsByName(String name);
    SimpleDTO selectDTODetailById(Integer id);
    List<ProductDTO> selectDTOsBySubcategorySortBy(Integer id, String sortType);
    List<Product> selectModelsBySubcategory(Integer id);
    List<ProductDTO> selectSimilarDTO(Integer subcategory, Integer currentProduct);
    long[] selectImages(List<Image> images);
    List<ProductDTO> selectDTOsForMainPage(byte criteriaType);
    Map<String,String> addProductToWishList(int id);
    Map<String, String> removeProductFromWishList(int id);
    List<ProductDTO> selectCustomerWishlist();
}
