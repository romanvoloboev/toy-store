package com.romanvoloboev.service;

import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;

/**
 * @author Roman Voloboev
 */

public interface CustomerService {
    void save(Customer customer) throws Exception;
    void saveByDTO(CustomerDTO customerDTO) throws Exception;
    void delete(Customer customer) throws Exception;
    Customer selectModel(String email) throws Exception;
    Customer selectModel(Integer id) throws Exception;
    Customer selectAuth();
    CustomerDTO selectSimpleDto(Customer customer) throws Exception;
    void updateProfile(CustomerDTO customerDTO, Customer customer) throws Exception;
    CustomerDTO prepareDTO(Customer customer, String name, String phone, String city, String street, String house, String flat) throws Exception;
}
