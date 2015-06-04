package com.romanvoloboev.repository;

import com.romanvoloboev.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    List<Review> getByCustomerId(Integer id);
    List<Review> getByProductId(Integer id);

    @Query("select count(r) from Review r where r.active = false")
    Short getNewReviewsCount();

    List<Review> getByActive(boolean status);

    @Query("select count(r) from Review r where r.customer.id = :id")
    long getCustomerReviewCount(@Param("id") Integer id);

    @Query("select count(r) from Review r where r.product.id = :id")
    long getProductReviewCount(@Param("id")Integer id);
}
