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
    public Customer select(String login) throws Exception;
    public Customer select(Integer id) throws Exception;

}
