package com.romanvoloboev.service;

import com.romanvoloboev.entity.User;
import com.romanvoloboev.service.UserBOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
    @Qualifier("userBOImpl")
    @Autowired private UserBOImpl customerBO;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        try {
            User user = customerBO.selectByEmail(email);
            if(user != null && user.isActive()) {
                List<GrantedAuthority> authorities = new ArrayList<>();
                authorities.add(new SimpleGrantedAuthority("customer"));
                return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), authorities);
            }
        } catch (Exception e) {
            throw new UsernameNotFoundException("no such customer");
        }
        throw new UsernameNotFoundException("customer account deactivated");
    }
}
