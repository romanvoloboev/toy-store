package com.romanvoloboev.service;

import com.romanvoloboev.model.Image;
import com.romanvoloboev.model.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;

/**
 * @author Roman Voloboev
 */

@ContextConfiguration(locations = {"classpath:spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ProductServiceImplTest {
    @Autowired private ProductService productService;
    @Autowired private ImageServiceImpl imageService;

    @Test
    public void saveProduct() throws Exception {
//        productService.save(new Product());
    }

}
