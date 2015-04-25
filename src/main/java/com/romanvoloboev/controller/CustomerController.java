package com.romanvoloboev.controller;

import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.Role;
import com.romanvoloboev.dto.AddressDTO;
import com.romanvoloboev.dto.SimpleCustomerDTO;
import com.romanvoloboev.service.AddressService;
import com.romanvoloboev.service.CustomerService;
import com.romanvoloboev.service.CustomerServiceImpl;
import com.romanvoloboev.service.AddressServiceImpl;
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
    
    @Qualifier("customerServiceImpl")
    @Autowired private CustomerService customerService;
    
    @Qualifier("addressServiceImpl")
    @Autowired private AddressService addressService;

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
            Customer customer = customerService.selectModel(email);
            if (customer != null) {
                LOGGER.log(Level.SEVERE, "Account " + email + " is already exist");
                response.put("status", "exist");
                return response;
            } else {
                customerService.save(new Customer(name, email, password, null, true, Role.CUSTOMER, null, null, null, null));
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
            Customer customer = customerService.selectAuth();
            modelAndView.addObject("customer", customerService.selectDto(customer));
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
            Customer customer = customerService.selectAuth();
            modelAndView.addObject("customer", customerService.selectDto(customer));
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
        List<AddressDTO> addressDTOs = null;
        Customer customer = customerService.selectAuth();
        if (name.equals("")) name = customer.getName();
        if (phone.equals("")) phone = customer.getPhone();
        if(!city.equals("") && !street.equals("") && !house.equals("")) {
            AddressDTO addressDTO = new AddressDTO(city, street, house, flat);
            try {
                addressService.isValid(addressDTO);
                addressDTOs = new ArrayList<>();
                addressDTOs.add(addressDTO);
            } catch (ValidationException e) {
                LOGGER.log(Level.SEVERE, e.getMessage());
                response.put("status", "wrongAddress");
                return response;
            }
        }
        SimpleCustomerDTO simpleCustomerDTO = new SimpleCustomerDTO(customer.getId(),
                name, customer.getEmail(), customerService.stringToPhone(phone), addressDTOs);
        try {
            customerService.update(simpleCustomerDTO, customer);
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
