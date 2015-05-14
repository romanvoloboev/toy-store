package com.romanvoloboev.repository;

import com.romanvoloboev.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Roman Voloboev
 */

public interface ReviewRepository extends JpaRepository<Review, Integer> {
}
