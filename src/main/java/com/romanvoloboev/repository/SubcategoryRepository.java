package com.romanvoloboev.repository;

import com.romanvoloboev.model.Category;
import com.romanvoloboev.model.Subcategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface SubcategoryRepository extends JpaRepository<Subcategory, Integer> {
    List<Subcategory> getByCategoryOrderByNameAsc(Category category);
    List<Subcategory> getByNameIgnoreCaseStartingWithAndActive(String name, boolean active);

//    @Query("select s from Subcategory s where s.category = ")
    List<Subcategory> getByCategoryAndActiveTrueOrderByNameAsc(Category category);
    List<Subcategory> getByCategoryIdAndActiveTrue(Integer id);
}
