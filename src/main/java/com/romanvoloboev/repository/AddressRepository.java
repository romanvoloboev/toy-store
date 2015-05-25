package com.romanvoloboev.repository;

import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface AddressRepository extends JpaRepository<Address, Integer> {
    List<Address> getByCustomer(Customer customer);
    Address getByIdAndCustomer(Integer id, Customer customer);

    @Query("select count(a) from Address a where a.customer.id = :id")
    Long getCountByCustomerId(@Param("id")Integer id);
}
