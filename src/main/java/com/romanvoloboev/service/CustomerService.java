package com.romanvoloboev.service;

import com.romanvoloboev.dto.AddressDTO;
import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

public interface CustomerService {
    default Role getRoleFromDTO(short role) {
        switch (role) {
            case 2:
                return Role.EMPLOYEE;
            case 3:
                return Role.ADMIN;
            default:
                return Role.CUSTOMER;
        }
    }

    default short getRoleFromModel(Role role) {
        switch (role) {
            case EMPLOYEE:
                return 2;
            case ADMIN:
                return 3;
            default:
                return 1;
        }
    }

    default String getTypeByRole(Role role) {
        switch (role) {
            case EMPLOYEE:
                return "Сотрудник";
            case ADMIN:
                return "Администратор";
            default:
                return "Пользователь";
        }
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


    void save(CustomerDTO customerDTO) throws Exception;
    void save(Customer customer);
    void delete(Customer customer) throws Exception;
    void delete(Integer id) throws Exception;
    Customer selectModel(String email) throws Exception;
    Customer selectModel(Integer id);
    Customer selectAuth();
    CustomerDTO selectSimpleDto(Customer customer) throws Exception;
    void updateProfile(CustomerDTO customerDTO, Customer customer) throws Exception;
    CustomerDTO prepareDTO(Customer customer, String name, String phone, String city, String street, String house, String flat) throws Exception;
    List<SimpleDTO> selectSimpleDTOsByName(String name, short role) throws Exception;
    List<Customer> selectModelsByNameContainsAndRole(String name, Role role) throws Exception;
    List<SimpleDTO> selectSimpleDTOsByEmail(String email, short role) throws Exception;
    List<Customer> selectModelsByEmailContainsAndRole(String email, Role role) throws Exception;
    List<CustomerDTO> selectCustomerDTOs() throws Exception;
    List<CustomerDTO> selectEmployeeDTOs() throws Exception;
    List<Customer> selectCustomerModels() throws Exception;
    List<Customer> selectEmployeesModels() throws Exception;
    long getReviewsCount(Integer id) throws Exception;
    void changeCustomerStatus(Integer id) throws Exception;
    List<CustomerDTO> selectDTO(Integer id) throws Exception;
    CustomerDTO selectDTObyId(Integer id) throws Exception;
    boolean changeEmployeeStatus(Integer id) throws Exception;
    boolean deleteEmployee(Integer id) throws Exception;
    boolean hasRole(String role);
    Map<String,String> registerCustomer(CustomerDTO customerDTO, HttpServletRequest request) throws Exception;
    Map<String, String> saveAddress(AddressDTO addressDTO);
    List<String> selectCities(Integer id);
    Long selectCustomersCount();
    void removeCustomerPhone();
    Map<String, String> changeCustomerPassword(String oldPass, String newPass, String repeatNewPass);
}
