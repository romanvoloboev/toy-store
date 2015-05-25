package com.romanvoloboev.repository;

import com.romanvoloboev.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    List<Review> getByCustomerId(Integer id);
    List<Review> getByProductId(Integer id);
}
