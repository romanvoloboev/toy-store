package com.romanvoloboev.service;

import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.dto.SubcategoryDTO;
import com.romanvoloboev.model.Category;
import com.romanvoloboev.model.Subcategory;

import java.util.Collection;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface SubcategoryService {
    void save(Subcategory subcategory) throws Exception;
    void save(List<Subcategory> subcategories) throws Exception;
    void save(SubcategoryDTO subcategoryDTO) throws Exception;
    void delete(Integer id) throws Exception;
    SubcategoryDTO selectDTO(Integer id);
    List<SubcategoryDTO> selectDTOs(Collection<Subcategory> subcategories) throws Exception;
    Subcategory selectModel(Integer id);
    List<Subcategory> selectModelsOrderByName(Category category, boolean onlyActive) throws Exception;
    List<SimpleDTO> selectSimpleDTOs(String name, boolean active) throws Exception;
    List<Subcategory> selectModels(String name, boolean active) throws Exception;
    List<SubcategoryDTO> selectDTOsByCategory(Integer id);
    SubcategoryDTO selectSubcategoryDTO(Integer id);
}
