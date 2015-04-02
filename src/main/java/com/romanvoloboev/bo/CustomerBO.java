package com.romanvoloboev.bo;

import com.romanvoloboev.entity.Customer;

/**
 * @author Roman Voloboev
 * Customer service layer
 */

public interface CustomerBO {
    public void save(Customer customer) throws Exception;
    public void delete(Customer customer) throws Exception;
    public void update(Customer customer) throws Exception;
    public Customer selectByEmail(String email) throws Exception;
    public Customer selectById(Integer id) throws Exception;

}
