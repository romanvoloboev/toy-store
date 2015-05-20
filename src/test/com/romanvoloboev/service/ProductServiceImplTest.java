package com.romanvoloboev.service;

import com.romanvoloboev.dto.ProductDTO;
import com.romanvoloboev.model.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author Roman Voloboev
 */

@ContextConfiguration(locations = {"classpath:spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ProductServiceImplTest {
    @Autowired private ProductServiceImpl productService;


    @Transactional
    @Test
    public void saveProduct() throws Exception {
    }

}
