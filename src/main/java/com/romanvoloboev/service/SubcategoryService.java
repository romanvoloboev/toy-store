package com.romanvoloboev.service;

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
    SubcategoryDTO selectDTO(Integer id) throws Exception;
    List<SubcategoryDTO> selectDTOs(Collection<Subcategory> subcategories) throws Exception;
    Subcategory selectModel(Integer id) throws Exception;
    List<Subcategory> selectModelsOrderByName(Category category) throws Exception;
}
