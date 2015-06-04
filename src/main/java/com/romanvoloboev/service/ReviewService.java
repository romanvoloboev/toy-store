package com.romanvoloboev.service;

import com.romanvoloboev.dto.ReviewDTO;

import javax.validation.ConstraintViolation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

public interface ReviewService {

    default String formatDateToString(Date date) {
        if (date == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        return dateFormat.format(date);
    }

    default Date formatStringToDate(String date) {
        if (date == null) return null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        try {
            return dateFormat.parse(date);
        } catch (ParseException e) {
            return null;
        }
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

    void save(ReviewDTO reviewDTO) throws ValidationException;
    List<ReviewDTO> selectDTOs();
    List<ReviewDTO> selectDTOsByCustomerId(Integer id);
    List<ReviewDTO> selectDTOsByProductId(Integer id);
    Short selectNewReviewsCount();
    List<ReviewDTO> selectDTOsByStatus(boolean status);
    long getCustomerReviewCount(Integer id);
    long getProductReviewCount(Integer id);
}
