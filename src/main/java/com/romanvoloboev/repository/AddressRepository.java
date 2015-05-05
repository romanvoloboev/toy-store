package com.romanvoloboev.repository;

import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface AddressRepository extends JpaRepository<Address, Integer> {
    Address getById(Integer id);
    List<Address> getByCustomer(Customer customer);
    Address getByIdAndCustomer(Integer id, Customer customer);

}