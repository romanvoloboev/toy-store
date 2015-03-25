package com.romanvoloboev.service;

import com.romanvoloboev.entity.Customer;
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
public class CustomerDetailService implements UserDetailsService {
    private static final Logger LOGGER = Logger.getLogger(EmployeeDetailService.class.getName());

    @Qualifier("customerBOImpl")
    @Autowired private CustomerBOImpl customerBO;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Customer customer = null;
        try {
            customer = customerBO.select(s);
        }
        catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Customer " + s + " not found");
            throw new UsernameNotFoundException("Customer " + s + " not found");
        }
        if(customer.isActive()) {
            List<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority("customer"));
            return new User(customer.getLogin(), customer.getPassword(), authorities);
        } else {
            LOGGER.log(Level.SEVERE, "Customer " + s + " is deactivated");
            throw new UsernameNotFoundException("Customer " + s + " is deactivated");
        }

    }
}
