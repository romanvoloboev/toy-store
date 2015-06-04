package com.romanvoloboev.service;

import com.romanvoloboev.dto.CategoryDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Category;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface CategoryService {
    void save(CategoryDTO categoryDTO) throws Exception;
    void save(Category category) throws Exception;
    void delete(Integer id) throws Exception;
    Category selectModel(Integer id);
    List<Category> selectModelsOrderByName(boolean onlyActive) throws Exception;
    List<Category> selectModelsByNameAndActive(String name, boolean active) throws Exception;
    SimpleDTO selectSimpleDTO(Integer id);
    List<CategoryDTO> selectDTOsWithSubcategories(boolean onlyActive) throws Exception;
    List<SimpleDTO> selectSimpleDTOs(String name, boolean active) throws Exception;
}
