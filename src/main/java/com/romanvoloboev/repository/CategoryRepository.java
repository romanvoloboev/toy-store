package com.romanvoloboev.repository;

import com.romanvoloboev.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    @Query("select c from Category c order by c.name asc")
    List<Category> getAllOrderByNameAsc();
    List<Category> getByNameIgnoreCaseStartingWithAndActive(String name, boolean active);
}
