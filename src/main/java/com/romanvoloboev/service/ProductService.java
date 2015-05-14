package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.model.Product;

/**
 * @author Roman Voloboev
 */

public interface ProductService {
    void save(ProductDTO productDTO) throws Exception;
    Product selectModel(Integer id) throws Exception;
}
