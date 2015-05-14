package com.romanvoloboev.service;

import com.romanvoloboev.dto.BrandDTO;
import com.romanvoloboev.model.Brand;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface BrandService {
    Brand selectModel(Integer id) throws Exception;
    List<Brand> selectModels() throws Exception;
    void save(BrandDTO brandDTO) throws Exception;
    void save(Brand brand) throws Exception;
    BrandDTO selectDTO(Integer id) throws Exception;
    void delete(Integer id) throws Exception;
    List<BrandDTO> selectDTOs() throws Exception;
}
