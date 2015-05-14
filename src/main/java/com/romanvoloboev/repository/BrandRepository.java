package com.romanvoloboev.repository;

import com.romanvoloboev.model.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Roman Voloboev
 */

public interface BrandRepository extends JpaRepository<Brand, Integer> {
}
