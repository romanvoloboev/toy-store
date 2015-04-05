package com.romanvoloboev.bo;

import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.model.SimpleCustomerModel;

/**
 * @author Roman Voloboev
 * Customer service layer
 */

public interface CustomerBO {
    public void save(Customer customer) throws Exception;
    public void save(SimpleCustomerModel simpleCustomerModel) throws Exception;
    public void delete(Customer customer) throws Exception;
    public void update(Customer customer) throws Exception;
    public Customer selectEntityByEmail(String email) throws Exception;
    public Customer selectEntityById(Integer id) throws Exception;
    public Customer selectAuth() throws Exception;
    public SimpleCustomerModel makeSimpleModel(Customer customer) throws Exception;

}
