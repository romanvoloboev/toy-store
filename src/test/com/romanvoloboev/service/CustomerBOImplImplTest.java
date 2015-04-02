package com.romanvoloboev.service;

import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.entity.Role;
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
public class CustomerBOImplImplTest {
    @Autowired private CustomerBOImpl customerBO;

    @Test
    public void testSave() throws Exception {
        customerBO.save(new Customer("Роман Admin", "test1@gmail.com", "password", "123-321-122",
                true, Role.ADMIN, null, null, null, null));

        customerBO.save(new Customer("Роман Employee", "test2@gmail.com", "password", "123-321-122",
                true, Role.EMPLOYEE, null, null, null, null));

        customerBO.save(new Customer("Роман Customer", "test3@gmail.com", "password", "123-321-122",
                true, Role.CUSTOMER, null, null, null, null));

    }
}
