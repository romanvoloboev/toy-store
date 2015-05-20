package com.romanvoloboev.repository;

import com.romanvoloboev.model.Image;
import com.romanvoloboev.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query("select p from Product p order by p.name asc")
    List<Product> getAllOrderByNameAsc();

    @Query("select p from Product p where p.name like %:name% and p.price between :priceStart and :priceEnd and p.active = :status")
    List<Product> getByNameContainingAndPriceBetweenAndActive(@Param("name")String name, @Param("priceStart") Float priceStart, @Param("priceEnd")Float priceEnd, @Param("status")boolean status);
//    List<Product> getByNameContainingAndPriceBetweenAndActive(String name, Float priceStart, Float priceEnd, boolean status);
}

