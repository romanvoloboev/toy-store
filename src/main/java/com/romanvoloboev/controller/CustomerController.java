package com.romanvoloboev.controller;

import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.entity.Role;
import com.romanvoloboev.model.AddressModel;
import com.romanvoloboev.model.SimpleCustomerModel;
import com.romanvoloboev.service.CustomerBOImpl;
import com.romanvoloboev.service.AddressBOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.ValidationException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

    @Qualifier("addressBOImpl")
    @Autowired private AddressBOImpl addressBO;


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
            modelAndView.addObject("customer", customerBO.makeModel(customer));
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
            modelAndView.addObject("customer", customerBO.makeModel(customer));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "", e);
        }
        return modelAndView;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/customer_update_profile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updateProfile(@RequestParam("name")String name, @RequestParam("phone")String phone,
                                             @RequestParam("city")String city, @RequestParam("street")String street,
                                             @RequestParam("house")String house, @RequestParam("flat")String flat) {
        Map<String, String> response = new HashMap<>();
        List<AddressModel> addressModels = null;
        Customer customer = customerBO.selectAuth();
        if (name.equals("")) name = customer.getName();
        if (phone.equals("")) phone = customer.getPhone();
        if(!city.equals("") && !street.equals("") && !house.equals("")) {
            AddressModel addressModel = new AddressModel(city, street, house, flat);
            try {
                addressBO.isValid(addressModel);
                addressModels = new ArrayList<>();
                addressModels.add(addressModel);
            } catch (ValidationException e) {
                LOGGER.log(Level.SEVERE, e.getMessage());
                response.put("status", "wrongAddress");
                return response;
            }
        }
        SimpleCustomerModel simpleCustomerModel = new SimpleCustomerModel(customer.getId(),
                name, customer.getEmail(), customerBO.textToPhone(phone), addressModels);
        try {
            customerBO.updateCustomerProfile(simpleCustomerModel, customer);
        } catch (ValidationException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "wrongName");
            return response;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
            return response;
        }
        response.put("status", "ok");
        return response;
    }
}
