package com.romanvoloboev.repository;

import com.romanvoloboev.model.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface BrandRepository extends JpaRepository<Brand, Integer> {
    List<Brand> getByNameIgnoreCaseStartingWithAndActive(String name, boolean active);
}
