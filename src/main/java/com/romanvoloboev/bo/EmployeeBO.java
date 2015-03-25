package com.romanvoloboev.bo;

import com.romanvoloboev.entity.Employee;

/**
 * @author Roman Voloboev
 * Employee service layer
 */

public interface EmployeeBO {
    public void save(Employee employee) throws Exception;
    public void delete (Employee employee) throws Exception;
    public void update(Employee employee) throws Exception;
    public Employee select(Integer id) throws Exception;
    public Employee select(String login) throws Exception;
}
