package com.romanvoloboev.bo;

import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.model.CustomerModel;
import com.romanvoloboev.model.SimpleCustomerModel;

/**
 * @author Roman Voloboev
 * Customer service layer
 */

public interface CustomerBO {
    public void save(Customer customer) throws Exception;
    public void saveByModel(CustomerModel customerModel) throws Exception;
    public void delete(Customer customer) throws Exception;
    public void update(Customer customer) throws Exception;
    public Customer selectEntityByEmail(String email) throws Exception;
    public Customer selectEntityById(Integer id) throws Exception;
    public Customer selectAuth() throws Exception;
    public SimpleCustomerModel makeModel(Customer customer) throws Exception;
    public void updateCustomerProfile(SimpleCustomerModel simpleCustomerModel, Customer customer) throws Exception;

}
