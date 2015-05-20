package com.romanvoloboev.service;

import com.romanvoloboev.dto.BrandDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Brand;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

@Service
public class BrandServiceImpl implements BrandService {
    public static final String NAME_PATTERN = "^[a-zA-Zа-яА-ЯёЁ ]+$";

    @Autowired private BrandRepository brandRepository;

    @Transactional
    @Override
    public void delete(Integer id) throws Exception {
        brandRepository.delete(id);
    }

    @Transactional
    @Override
    public void save(Brand brand) throws Exception {
        brandRepository.save(brand);
    }

    @Transactional(readOnly = true)
    @Override
    public Brand selectModel(Integer id) throws Exception {
        return brandRepository.getOne(id);
    }

    @Override
    public List<Brand> selectModels() throws Exception {
        return brandRepository.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public List<BrandDTO> selectDTOs() throws Exception {
        List<Brand> brands = selectModels();
        List<BrandDTO> brandDTOs = new ArrayList<>();
        for (Brand brand:brands) {
            brandDTOs.add(new BrandDTO(brand.getId(), brand.getName(), brand.getCountry(), brand.isActive()));
        }
        return brandDTOs;
    }

    @Transactional
    @Override
    public List<SimpleDTO> selectSimpleDTOs(String name, boolean active) throws Exception {
        List<Brand> brands = selectModels(name, active);
        List<SimpleDTO> simpleDTOs = new ArrayList<>();
        for (Brand brand:brands) {
            simpleDTOs.add(new SimpleDTO(brand.getId(), brand.getName()));
        }
        return simpleDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<Brand> selectModels(String name, boolean active) throws Exception {
        return brandRepository.getByNameIgnoreCaseStartingWithAndActive(name, active);
    }

    @Transactional(readOnly = true)
    @Override
    public BrandDTO selectDTO(Integer id) throws Exception {
        Brand brand = selectModel(id);
        if (brand == null) throw new NullPointerException("The requested brand was not found");
        return new BrandDTO(brand.getId(), brand.getName(), brand.getCountry());
    }

    @Transactional
    @Override
    public void save(BrandDTO brandDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(brandDTO, validator)) {
            Brand brand;
            if (brandDTO.getId() == 0) {
                brand = new Brand(brandDTO.getName(), brandDTO.getCountry(), true, null);
            } else {
                brand = selectModel(brandDTO.getId());
                brand = new Brand(brandDTO.getId(), brandDTO.getName(), brandDTO.getCountry(), brand.isActive(), brand.getProducts());
            }
            save(brand);
        }
    }

    @Transactional
    public void changeBrandStatus(Integer id) throws Exception {
        Brand brand = selectModel(id);
        if (brand == null) throw new NullPointerException("No brand was found");
        List<Product> products = brand.getProducts();
        if (brand.isActive()) {
            brand.setActive(false);
            if (products != null) {
                for (Product product:products) {
                    product.setActive(false);
                }
            }
        } else {
            brand.setActive(true);
            if (products != null) {
                for (Product product:products) {
                    product.setActive(true);
                }
            }
        }
        save(brand);
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
