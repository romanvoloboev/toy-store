package com.romanvoloboev.service;

import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.ReviewDTO;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.model.enums.Role;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@ContextConfiguration(locations = {"classpath:spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class DataFillTest {
    @Autowired private CustomerService customerService;
    @Autowired private ProductServiceImpl productService;
    @Autowired private ReviewServiceImpl reviewService;

    @Test
    public void testSave() throws Exception {
        customerService.save(new CustomerDTO(0, "Роман", "test1@gmail.com", "password", "380501234567", true, (short)3, null));
    }

    @Test
    public void fillCustomerAddress() throws Exception {
        Customer customer = customerService.selectModel("test1@gmail.com");
        List<Address> addresses = new ArrayList<>();
        addresses.add(new Address("Никополь", "Херсонская", "117", null, customer));
        addresses.add(new Address("Никополь", "Электрометталургов", "55", "4", customer));
        customer.setAddresses(addresses);
        customerService.save(customer);
    }

    @Test
    public void fillReviews() throws Exception {
        reviewService.save(new ReviewDTO("Крутой товар! Очень понравился, советую.", (float)4.5, 1, 1));
    }
}
