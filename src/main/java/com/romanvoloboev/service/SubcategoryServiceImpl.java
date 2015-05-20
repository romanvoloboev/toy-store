package com.romanvoloboev.service;

import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.dto.SubcategoryDTO;
import com.romanvoloboev.model.Category;
import com.romanvoloboev.model.Image;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.model.Subcategory;
import com.romanvoloboev.repository.SubcategoryRepository;
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
public class SubcategoryServiceImpl implements SubcategoryService {
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁ ]+$";

    @Autowired private SubcategoryRepository subcategoryRepository;
    @Autowired private CategoryServiceImpl categoryService;
    @Autowired private ImageServiceImpl imageService;

    @Transactional
    @Override
    public void delete(Integer id) throws Exception {
        subcategoryRepository.delete(id);
    }

    @Transactional
    @Override
    public void save(Subcategory subcategory) throws Exception {
        subcategoryRepository.save(subcategory);
    }

    @Transactional
    @Override
    public void save(List<Subcategory> subcategories) throws Exception {
        subcategoryRepository.save(subcategories);
    }

    @Transactional
    @Override
    public void save(SubcategoryDTO subcategoryDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(subcategoryDTO, validator)) {
            Subcategory subcategory;
            Category category = categoryService.selectModel(subcategoryDTO.getCategory());
            Image image = imageService.selectModel(subcategoryDTO.getImage());
            if (subcategoryDTO.getId() == 0) {
                subcategory = new Subcategory(subcategoryDTO.getName(), true, category, image);
            } else {
                subcategory = selectModel(subcategoryDTO.getId());
                long oldImageId = subcategory.getImage().getId();
                if (oldImageId != subcategoryDTO.getImage()) {
                    imageService.delete(oldImageId);
                }
                subcategory = new Subcategory(subcategoryDTO.getId(), subcategoryDTO.getName(),
                        subcategory.isActive(), category, image, subcategory.getProducts());
            }
            save(subcategory);
        }
    }

    @Transactional(readOnly = true)
    @Override
    public List<SubcategoryDTO> selectDTOs(Collection<Subcategory> subcategories) throws Exception{
        List<SubcategoryDTO> subcategoryDTOs = new ArrayList<>();
        for (Subcategory subcategory:subcategories) {
            subcategoryDTOs.add(new SubcategoryDTO(subcategory.getId(), subcategory.getName(),
                    subcategory.isActive(), subcategory.getCategory().getId()));
        }
        return subcategoryDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public Subcategory selectModel(Integer id) throws Exception{
        return subcategoryRepository.getOne(id);
    }

    @Transactional(readOnly = true)
    @Override
    public SubcategoryDTO selectDTO(Integer id) throws Exception {
        Subcategory subcategory = selectModel(id);
        if (subcategory == null) throw new NullPointerException("The requested subcategory was not found");
        return new SubcategoryDTO(subcategory.getId(), subcategory.getName(),
                subcategory.getCategory().getId(), subcategory.getImage().getId());
    }

    @Transactional(readOnly = true)
    @Override
    public List<Subcategory> selectModelsOrderByName(Category category) throws Exception {
        return subcategoryRepository.getByCategoryOrderByNameAsc(category);
    }

    @Transactional(readOnly = true)
    @Override
    public List<SimpleDTO> selectSimpleDTOs(String name, boolean active) throws Exception {
        List<Subcategory> subcategories = selectModels(name, active);
        List<SimpleDTO> simpleDTOs = new ArrayList<>();
        for (Subcategory subcategory:subcategories) {
            simpleDTOs.add(new SimpleDTO(subcategory.getId(), subcategory.getName()));
        }
        return simpleDTOs;
    }


    @Transactional(readOnly = true)
    @Override
    public List<Subcategory> selectModels(String name, boolean active) {
        return subcategoryRepository.getByNameIgnoreCaseStartingWithAndActive(name, active);
    }

    @Transactional
    public void changeSubcategoryStatus(Integer id) throws Exception {
        Subcategory subcategory = selectModel(id);
        if (subcategory == null) throw new NullPointerException("No subcategory was found");
        List<Product> products = subcategory.getProducts();
        if (subcategory.isActive()) {
            subcategory.setActive(false);
            if (products != null) {
                for (Product product:products) {
                    product.setActive(false);
                }
            }
        } else {
            subcategory.setActive(true);
            if (products != null) {
                for (Product product:products) {
                    product.setActive(true);
                }
            }
        }
        save(subcategory);
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

//    @Transactional(readOnly = true)
//    private List<Product> selectProducts(int[] ids) throws Exception {
//        List<Product> products = new ArrayList<>();
//        for (int id:ids) {
//            Product product = productService.selectModel(id);
//            if (product != null) {
//                products.add(product);
//            }
//        }
//        return products;
//    }
//
//    private int[] selectProducts(List<Product> products) throws Exception {
//        int[] ids = new int[products.size()];
//        int i = 0;
//        for (Product product:products) {
//            if (product != null) {
//                ids[i++] = product.getId();
//            }
//        }
//        return ids;
//    }
}
