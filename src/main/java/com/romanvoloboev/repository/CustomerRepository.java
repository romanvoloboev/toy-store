package com.romanvoloboev.repository;

import com.romanvoloboev.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * @author Roman Voloboev
 */

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    Customer selectByEmailIgnoreCase(String email);
}
