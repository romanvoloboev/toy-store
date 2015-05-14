package com.romanvoloboev.repository;

import com.romanvoloboev.model.Category;
import com.romanvoloboev.model.Subcategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface SubcategoryRepository extends JpaRepository<Subcategory, Integer> {
    List<Subcategory> getByCategoryOrderByNameAsc(Category category);
}
