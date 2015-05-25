package com.romanvoloboev.repository;

import com.romanvoloboev.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("select p from Product p order by p.name asc")
    List<Product> getAllOrderByNameAsc();

    List<Product> getByNameContainingAndPriceBetweenAndActive(String name, Double priceStart, Double priceEnd, boolean status);
    List<Product> getByNameStartingWith(String name);
}

