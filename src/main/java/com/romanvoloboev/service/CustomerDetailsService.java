package com.romanvoloboev.service;

import com.romanvoloboev.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 */

@Service("customerDetailsService")
public class CustomerDetailsService implements UserDetailsService {
    private static final Logger LOGGER = Logger.getLogger(CustomerDetailsService.class.getName());

    @Qualifier("customerServiceImpl")
    @Autowired private CustomerService customerService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        try {
            Customer customer = customerService.selectModel(email);
            if(customer != null && customer.isActive()) {
                List<GrantedAuthority> authorities = new ArrayList<>();
                if (customer.getRole().toString().equals("ADMIN")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
                    authorities.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));
                    authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
                } else if (customer.getRole().toString().equals("EMPLOYEE")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));
                    authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
                } else {
                    authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
                }
                return new User(customer.getEmail(), customer.getPassword(), authorities);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Customer " + email + " not found");
            throw new UsernameNotFoundException("Customer not found");
        }
        LOGGER.log(Level.SEVERE, "Customer " + email + " deactivated");
        throw new UsernameNotFoundException("Customer deactivated");
    }
}
