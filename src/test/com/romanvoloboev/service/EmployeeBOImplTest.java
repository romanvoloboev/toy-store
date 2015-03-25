package com.romanvoloboev.service;

import com.romanvoloboev.bo.EmployeeBO;
import com.romanvoloboev.entity.Employee;
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
public class EmployeeBOImplTest {
    @Autowired private EmployeeBO employeeBO;

    @Test
    public void testSave() throws Exception {
        employeeBO.save(new Employee("roman voloboev", "romanvoloboev@gmail.com", "password", true, true));
        employeeBO.save(new Employee("roman test", "test@gmail.com", "password", true, false));
    }
}
