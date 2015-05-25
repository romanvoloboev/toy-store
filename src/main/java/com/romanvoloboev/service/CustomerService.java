package com.romanvoloboev.service;

import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;
import java.util.Map;

/**
 * @author Roman Voloboev
 */

public interface CustomerService {
    void save(Customer customer) throws Exception;
    void save(CustomerDTO customerDTO) throws Exception;
    void delete(Customer customer) throws Exception;
    void delete(Integer id) throws Exception;
    Customer selectModel(String email) throws Exception;
    Customer selectModel(Integer id) throws Exception;
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
}
