package com.romanvoloboev.service;

import com.romanvoloboev.dto.CategoryDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Category;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.model.Subcategory;
import com.romanvoloboev.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

@Service
public class CategoryServiceImpl implements CategoryService {
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁ ]+$";

    @Autowired private CategoryRepository categoryRepository;
    @Autowired private SubcategoryServiceImpl subcategoryService;
    @Autowired private ProductService productService;

    @Transactional
    @Override
    public void save(Category category) throws Exception {
        categoryRepository.save(category);
    }

    @Transactional
    @Override
    public void save(CategoryDTO categoryDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(categoryDTO, validator)) {
            Category category;
            if (categoryDTO.getId() == 0) {
                category = new Category(categoryDTO.getName(), true, null);
            } else {
                category = selectModel(categoryDTO.getId());
                category.setName(categoryDTO.getName());
            }
            save(category);
        }
    }

    @Transactional
    @Override
    public void delete(Integer id) throws Exception {
        categoryRepository.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Category selectModel(Integer id) {
        return categoryRepository.findOne(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Category> selectModelsByNameAndActive(String name, boolean active) throws Exception {
        return categoryRepository.getByNameIgnoreCaseStartingWithAndActive(name, active);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Category> selectModelsOrderByName(boolean onlyActive) throws Exception {
        if (onlyActive) {
            return categoryRepository.getActiveOrderByNameAsc();
        } else {
            return categoryRepository.getAllOrderByNameAsc();
        }

    }

    @Transactional(readOnly = true)
    @Override
    public List<CategoryDTO> selectDTOsWithSubcategories(boolean onlyActive) throws Exception {
        List<CategoryDTO> categoryDTOs = new ArrayList<>();
        List<Category> categories = selectModelsOrderByName(onlyActive);
        for (Category category:categories) {
            categoryDTOs.add(new CategoryDTO(category.getId(), category.getName(), category.isActive(),
                    subcategoryService.selectDTOs(subcategoryService.selectModelsOrderByName(category, onlyActive))));
        }
        return categoryDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<SimpleDTO> selectSimpleDTOs(String name, boolean active) throws Exception {
        List<SimpleDTO> categoryDTOs = new ArrayList<>();
        List<Category> categories = selectModelsByNameAndActive(name, active);
        for (Category category:categories) {
            categoryDTOs.add(new SimpleDTO(category.getId(), category.getName()));
        }
        return categoryDTOs;
    }

    @Transactional
    @Override
    public SimpleDTO selectSimpleDTO(Integer id) {
        Category category = selectModel(id);
        if (category == null) return null;
        return new SimpleDTO(category.getId(), category.getName());
    }

    @Transactional
    public void changeCategoryStatus(Integer id) throws Exception {
        Category category = selectModel(id);
        if (category == null) throw new NullPointerException("No category found");
        Collection<Subcategory> subcategories = category.getSubcategories();
        if (category.isActive()) {
            category.setActive(false);
            if (subcategories != null) {
                for (Subcategory subcategory:subcategories) {
                    subcategory.setActive(false);
                    List<Product> products = productService.selectModelsBySubcategory(subcategory.getId());
                    if (products != null) {
                        for (Product product:products) {
                            product.setActive(false);
                        }
                    }
                }
            }
        } else {
            category.setActive(true);
            if (subcategories != null) {
                for (Subcategory subcategory:subcategories) {
                    subcategory.setActive(true);
                    List<Product> products = productService.selectModelsBySubcategory(subcategory.getId());
                    if (products != null) {
                        for (Product product:products) {
                            product.setActive(true);
                        }
                    }
                }
            }
        }
        save(category);
    }

    private boolean validate(Object object, Validator validator) throws ValidationException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);

        if (constraintViolations.size() > 0){
            StringBuilder errorString = new StringBuilder();
            for (ConstraintViolation<Object> cv : constraintViolations){
                errorString.append(String.format("Format error in property: [%s], value: [%s], message: [%s]",
                        cv.getPropertyPath(), cv.getInvalidValue(), cv.getMessage()));
            }
            throw new ValidationException(errorString.toString());
        }
        return true;
    }
}
