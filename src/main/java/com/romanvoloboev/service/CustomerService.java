package com.romanvoloboev.service;

import com.romanvoloboev.model.Customer;
import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.SimpleCustomerDTO;

/**
 * @author Roman Voloboev
 */

public interface CustomerService {
    void save(Customer customer) throws Exception;
    void saveByModel(CustomerDTO customerDTO) throws Exception;
    void delete(Customer customer) throws Exception;
    Customer selectModel(String email) throws Exception;
    Customer selectModel(Integer id) throws Exception;
    Customer selectAuth();
    SimpleCustomerDTO selectDto(Customer customer) throws Exception;
    void update(SimpleCustomerDTO simpleCustomerDTO, Customer customer) throws Exception;
    String phoneToString(String phone);
    String stringToPhone(String phone);

}
