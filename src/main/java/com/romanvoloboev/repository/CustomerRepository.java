package com.romanvoloboev.repository;

import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


/**
 * @author Roman Voloboev
 */

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    Customer getByEmailIgnoreCase(String email);
    List<Customer> getByNameContainsIgnoreCaseAndRole(String name, Role role);
    List<Customer> getByEmailContainsAndRole(String email, Role role);

    @Query("select c from Customer c where c.role = 'CUSTOMER'")
    List<Customer> getAllCustomers();

    @Query("select c from Customer c where c.role <> 'CUSTOMER'")
    List<Customer> getAllEmployees();
}
