package com.romanvoloboev.controller;

import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.entity.Role;
import com.romanvoloboev.service.CustomerBOImpl;
import com.romanvoloboev.service.DeliveryAddressBOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Roman Voloboev
 * controller for login and registration pages
 */

@Controller
public class CustomerController {
    private static final Logger LOGGER = Logger.getLogger(CustomerController.class.getName());

    @Qualifier("customerBOImpl")
    @Autowired private CustomerBOImpl customerBO;

    @Qualifier("deliveryAddressBOImpl")
    @Autowired private DeliveryAddressBOImpl deliveryAddressBO;


    @PreAuthorize("isAnonymous()")
    @RequestMapping("/customer_login")
    public ModelAndView userLogin(@RequestParam(value = "failed", defaultValue = "false")boolean failed,
                                  @RequestParam(value = "exist", defaultValue = "false")boolean exist,
                                  @RequestParam(value = "error", defaultValue = "false")boolean error) {
        ModelAndView modelAndView = new ModelAndView("store/login");
        modelAndView.addObject("failed", failed);
        modelAndView.addObject("exist", exist);
        modelAndView.addObject("error", error);
        return modelAndView;
    }

    @PreAuthorize("isAnonymous()")
    @RequestMapping("/customer_sign_up")
    @ResponseBody
    public Map<String, String> signUp(@RequestParam("name")String name, @RequestParam("email")String email,
                                      @RequestParam("pass")String password) {
        Map<String, String> response = new HashMap<>();
        try {
            if (name.trim().equals("") || email.trim().equals("") || password.trim().equals("")) {
                throw new Exception("Invalid parameters");
            }
            Customer customer = customerBO.selectEntityByEmail(email);
            if (customer != null) {
                LOGGER.log(Level.SEVERE, "Account " + email + " is already exist");
                response.put("status", "exist");
                return response;
            } else {
                customerBO.save(new Customer(name, email, password, null, true, Role.CUSTOMER, null, null, null, null));
                LOGGER.log(Level.SEVERE, "Account " + email + " has successful created");
                response.put("status", "ok");
                return response;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "", e);
            response.put("status", "error");
            return response;
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/profile")
    public ModelAndView loadProfile(){
        ModelAndView modelAndView = new ModelAndView("store/profile");
        try {
            Customer customer = customerBO.selectAuth();
            modelAndView.addObject("customer", customerBO.makeSimpleModel(customer));
            modelAndView.addObject("addressesList", deliveryAddressBO.makeSimpleModelList(customer));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "", e);
        }
        return modelAndView;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/edit_profile")
    public ModelAndView editProfile() {
        ModelAndView modelAndView = new ModelAndView("store/edit_profile");
        try {
            Customer customer = customerBO.selectAuth();
            modelAndView.addObject("customer", customerBO.makeSimpleModel(customer));
            modelAndView.addObject("addressesList", deliveryAddressBO.makeSimpleModelList(customer));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "", e);
        }
        return modelAndView;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/customer_update_profile")
    public Map<String, String> updateProfile(@RequestParam("name")String name, @RequestParam("phone")String phone,
                                             @RequestParam("city")String city, @RequestParam("street")String street,
                                             @RequestParam("house")String house, @RequestParam("flat")String flat) {
        Map<String, String> response = new HashMap<>();
        try {
            if (name.trim().equals("")) {
                throw new Exception("Wrong parameter");
            }
        } catch (Exception e) {
            response.put("status", "emptyName");
            return response;
        }

        Customer customer = customerBO.selectAuth();
        customer.setName(name);
        if (!phone.trim().equals("")) customer.setPhone(phone);

        if (!city.trim().equals("") && !street.trim().equals("") && !house.trim().equals("")) {
            //todo: set address fo customer
            if (!flat.trim().equals("")) {
                //todo: set flat number if exist
            }
        }

//        try {
//            customerBO.update(customer);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

    }
}
