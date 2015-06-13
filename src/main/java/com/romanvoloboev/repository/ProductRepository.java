package com.romanvoloboev.repository;

import com.romanvoloboev.model.Product;
import org.springframework.data.domain.Pageable;
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

    List<Product> getByNameContainingAndPriceBetweenAndActive(String name, Double priceStart, Double priceEnd, boolean status);
    List<Product> getByNameStartingWith(String name);
    List<Product> getByActiveTrueAndSubcategoryIdOrderByPriceAsc(Integer id);
    List<Product> getByActiveTrueAndSubcategoryIdOrderByPriceDesc(Integer id);
    List<Product> getByActiveTrueAndSubcategoryIdOrderByRatingDesc(Integer id);
    List<Product> getByActiveTrueAndSubcategoryIdOrderByDateDesc(Integer id);
    List<Product> getBySubcategoryId(Integer id);
    Product getByIdAndActiveTrue(Integer id);
    List<Product> getFirst5BySubcategoryIdAndIdNotOrderByRatingDesc(Integer subcategory, Integer currentProduct);
    List<Product> getByActiveTrueAndPromotionTrue(Pageable pageable);
    List<Product> getByActiveTrueOrderByDateDesc(Pageable pageable);
}

