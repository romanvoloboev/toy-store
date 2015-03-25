package com.romanvoloboev.service;

import com.romanvoloboev.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Component
public class EmployeeDetailService implements UserDetailsService {
    private static final Logger LOGGER = Logger.getLogger(EmployeeDetailService.class.getName());

    @Qualifier("employeeBOImpl")
    @Autowired private EmployeeBOImpl employeeBO;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Employee employee = null;
        try {
            employee = employeeBO.select(s);
            if(employee.isActive()) {
                List<GrantedAuthority> authorities = new ArrayList<>();
                authorities.add(new SimpleGrantedAuthority("employee"));
                return new User(employee.getLogin(), employee.getPassword(), authorities);
            } else {
                LOGGER.log(Level.SEVERE, "Employee " + s + " is deactivated");
                throw new UsernameNotFoundException("Employee " + s + " is deactivated");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Employee " + s + " not found");
            throw new UsernameNotFoundException("Employee " + s + " not found");
        }
    }
}
