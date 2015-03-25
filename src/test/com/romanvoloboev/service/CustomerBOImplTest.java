package com.romanvoloboev.service;

import com.romanvoloboev.entity.Customer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Roman Voloboev
 */

@ContextConfiguration(locations = {"classpath:spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class CustomerBOImplTest {
    @Autowired private CustomerBOImpl customerBO;

    @Test
    public void testSave() throws Exception {
        customerBO.save(new Customer("roman v", "test@gmail.com", "password", "123321", true, null, null, null, null));
    }
}
