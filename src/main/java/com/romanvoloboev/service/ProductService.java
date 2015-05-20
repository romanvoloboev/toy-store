package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.model.Product;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface ProductService {
    void save(ProductDTO productDTO) throws Exception;
    void save(Product product) throws Exception;
    void delete(Integer id) throws Exception;
    Product selectModel(Integer id) throws Exception;
    List<ProductDTO> selectDTOs() throws Exception;
    List<Product> selectModels() throws Exception;
    List<ProductDTO> searchBy(String name, Float priceStart, Float priceEnd, int status) throws Exception;
    List<Product> selectModels(String name, Float priceStart, Float priceEnd, boolean status) throws Exception;
    ProductDTO selectDTO(Integer id) throws Exception;
    void changeProductStatus(Integer id) throws Exception;
}
