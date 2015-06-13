package com.romanvoloboev.service;

import com.romanvoloboev.dto.BookingDTO;
import com.romanvoloboev.dto.BookingItemDTO;
import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.model.BookingItem;
import com.romanvoloboev.model.Image;


import javax.validation.ConstraintViolation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

public interface OrderService {
    default String formatDateToString(Date date) {
        if (date == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        dateFormat.setLenient(false);
        return dateFormat.format(date);
    }

    default String phoneToString(String phone) {
        if (!phone.equals("")) {
            phone = "+" + phone.substring(0, 2) + "(" + phone.substring(2, 5) + ")" +
                    phone.substring(5, 8) + "-" + phone.substring(8, 10) + "-" + phone.substring(10);
        }
        return phone;
    }

    default String stringToPhone(String phone) {
        if (!phone.equals("")) {
            return phone.replace("+", "").replace("(", "").replace(")", "").replace("-", "").replace("-", "");
        }
        return phone;
    }

    default String formatStatusToString(short status) {
        switch (status) {
            case 1: return "Открыт";
            case 2: return "Отклонён";
            case 3: return "Выполнен";
            case 4: return "Доставляется";
            default: return "Не указан";
        }
    }

    default String formatDeliveryServiceToString(short service) {
        switch (service) {
            case 1: return "Новая Почта";
            case 2: return "Мист Экспресс";
            case 3: return "Postman";
            default: return "Не указана";
        }
    }

    default String formatDeliveryTypeToString(short delivery) {
        switch (delivery) {
            case 1: return "Самовывоз";
            case 2: return "Курьер";
            default: return "Не указан";
        }
    }

    default String formatPaymentTypeToString(short payment) {
        switch (payment) {
            case 1: return "Наличными";
            case 2: return "Безналичными";
            default: return "Не указан";
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

    default long[] selectImages(List<Image> images) {
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

    List<BookingDTO> selectDTOs();
    BookingDTO selectDTO(Integer id) throws Exception;
    void save(BookingDTO bookingDTO) throws Exception;
    void deleteOrder(Integer id) throws Exception;
    void changeStatus(Integer id, short status) throws Exception;
    List<BookingDTO> searchOrder(Integer orderId, short status, Integer customerId) throws Exception;
    Short selectNewOrdersCount();
    List<BookingDTO> selectLastDTOs();
    Integer selectSoldProductsCount();
    Float selectTotalOrdersAmount();
    List<BookingDTO> selectCustomerOrders();
    List<BookingItemDTO> selectOrderDetails(int id);
}
