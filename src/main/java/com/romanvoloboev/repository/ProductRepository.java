package com.romanvoloboev.repository;

import com.romanvoloboev.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Roman Voloboev
 */

public interface ProductRepository extends JpaRepository<Product, Integer> {

}

