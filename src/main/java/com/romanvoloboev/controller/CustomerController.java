package com.romanvoloboev.controller;

import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.service.AddressService;
import com.romanvoloboev.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ValidationException;
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

    @Autowired private CustomerService customerService;
    @Autowired private AddressService addressService;

    @PreAuthorize("isAnonymous()")
    @RequestMapping("/customer_login")
    public ModelAndView userLogin(@RequestParam(value = "failed", defaultValue = "false")boolean failed,
                                  @RequestParam(value = "exist", defaultValue = "false")boolean exist,
                                  @RequestParam(value = "error", defaultValue = "false")boolean error,
                                  @RequestParam(value = "params_error", defaultValue = "false")boolean params) {
        ModelAndView modelAndView = new ModelAndView("store/login");
        modelAndView.addObject("failed", failed);
        modelAndView.addObject("exist", exist);
        modelAndView.addObject("error", error);
        modelAndView.addObject("params_error", params);
        return modelAndView;
    }

    @PreAuthorize("isAnonymous()")
    @RequestMapping(value = "/customer_sign_up", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> signUp(@RequestBody CustomerDTO customerDTO, HttpServletRequest request) {
        Map<String, String> response = new HashMap<>();
        try {
            response = customerService.registerCustomer(customerDTO, request);
        } catch (ValidationException e) {
            response.put("status", "wrongParams");
        }
        catch (Exception e) {
            response.put("status", "error");
        }
        return response;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/profile")
    public ModelAndView loadProfile(){
        ModelAndView modelAndView = new ModelAndView("store/profile");
        try {
            Customer customer = customerService.selectAuth();
            modelAndView.addObject("customer", customerService.selectSimpleDto(customer));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/edit_profile")
    public ModelAndView editProfile() {
        ModelAndView modelAndView = new ModelAndView("store/edit_profile");
        try {
            Customer customer = customerService.selectAuth();
            modelAndView.addObject("customer", customerService.selectSimpleDto(customer));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("/customer_remove_phone")
    @ResponseBody
    public Map<String, String> removePhone() {
        Map<String, String> response = new HashMap<>();
        try {
            Customer customer = customerService.selectAuth();
            customer.setPhone("");
            customerService.save(customer);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "phoneDeleteError");
        }
        return response;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/customer_remove_address", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> removeAddress(@RequestParam("id") Integer id) {
        Map<String, String> response = new HashMap<>();
        Customer customer = customerService.selectAuth();
        try {
            addressService.removeCustomerAddress(id, customer);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "noSuchAddress");
        }
        return response;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/customer_change_password", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> changePassword(@RequestParam("old_password")String oldPass,
                                              @RequestParam("new_password")String newPass,
                                              @RequestParam("repeat_new_pass")String repeatNewPass) {
        Map<String, String> response = new HashMap<>();
        Customer customer = customerService.selectAuth();
        if (oldPass.equals(customer.getPassword())) {
            if (newPass.equals(repeatNewPass)) {
                customer.setPassword(newPass);
                try {
                    customerService.save(customer);
                    response.put("status", "ok");
                } catch (Exception e) {
                    LOGGER.log(Level.SEVERE, e.getMessage());
                    response.put("status", "unknownError");
                }
            } else {
                response.put("status", "wrongRepeatPassword");
            }
        } else {
            response.put("status", "wrongOldPassword");
        }
        return response;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/customer_update_profile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updateProfile(@RequestParam("name")String name, @RequestParam("phone")String phone,
                                             @RequestParam("city")String city, @RequestParam("street")String street,
                                             @RequestParam("house")String house, @RequestParam("flat")String flat) {
        Map<String, String> response = new HashMap<>();
        Customer customer = customerService.selectAuth();
        CustomerDTO customerDTO;
        try {
            customerDTO = customerService.prepareDTO(customer, name, phone, city, street, house, flat);
            customerService.updateProfile(customerDTO, customer);
            response.put("status", "ok");
        } catch (ValidationException e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "wrongParams");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "unknownError");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/load_by_name", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SimpleDTO>> loadCustomersNames(@RequestParam("name")String name) {
        Map<String, List<SimpleDTO>> response = new HashMap<>();
        List<SimpleDTO> names = null;
        try {
            names = customerService.selectSimpleDTOsByName(name, (short) 1);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        response.put("suggestions", names);
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/load_by_email", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SimpleDTO>> loadCustomersByEmail(@RequestParam("email")String email) {
        Map<String, List<SimpleDTO>> response = new HashMap<>();
        List<SimpleDTO> emails = null;
        try {
            emails = customerService.selectSimpleDTOsByEmail(email, (short) 1);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        response.put("suggestions", emails);
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer")
    public ModelAndView loadCustomers() {
        ModelAndView modelAndView = new ModelAndView("cp/customer");
        try {
            modelAndView.addObject("customer", customerService.selectCustomerDTOs());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> deleteCustomer(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            customerService.delete(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/change_status", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> changeCustomerStatus(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            customerService.changeCustomerStatus(id);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/search_by", method = RequestMethod.GET)
    public ModelAndView searchCustomer(@RequestParam(value = "id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/customer");
        try {
            modelAndView.addObject("customer", customerService.selectDTO(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/add")
    public ModelAndView addCustomer() {
        return new ModelAndView("cp/customer_add");
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/customer/edit", method = RequestMethod.GET)
    public ModelAndView editCustomer(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/customer_edit");
        try {
            modelAndView.addObject("customer", customerService.selectDTObyId(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: error page
        }
        return modelAndView;
    }

    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/employee")
    public ModelAndView loadEmployee() {
        ModelAndView modelAndView = new ModelAndView("cp/employee");
        try {
            modelAndView.addObject("employee", customerService.selectEmployeeDTOs());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
        }
        return modelAndView;
    }

    @ResponseBody
    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/employee/change_status")
    public Map<String, String> changeEmployeeStatus(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            if (customerService.changeEmployeeStatus(id)) {
                response.put("status", "ok");
            } else {
                response.put("status", "no_access");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @ResponseBody
    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/employee/delete")
    public Map<String, String> deleteEmployee(@RequestParam("id")int id) {
        Map<String, String> response = new HashMap<>();
        try {
            if (customerService.deleteEmployee(id)) {
                response.put("status", "ok");
            } else {
                response.put("status", "no_access");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }

    @ResponseBody
    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/employee/check_access")
    public Map<String, String> chackAccess() {
        Map<String, String> response = new HashMap<>();
        if (customerService.hasRole("ROLE_ADMIN")) {
            response.put("status", "ok");
        } else {
            response.put("status", "no_access");
        }
        return response;
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/cp/employee/add")
    public ModelAndView addEmployee() {
        return new ModelAndView("cp/employee_add");
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/cp/employee/edit")
    public ModelAndView editEmployee(@RequestParam("id")int id) {
        ModelAndView modelAndView = new ModelAndView("cp/employee_edit");
        try {
            modelAndView.addObject("employee", customerService.selectDTObyId(id));
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            //todo: error page
        }
        return modelAndView;
    }

    @ResponseBody
    @PreAuthorize("hasRole('ROLE_EMPLOYEE')")
    @RequestMapping(value = "/cp/user/save", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, String> saveEmployee(@RequestBody CustomerDTO employee) {
        Map<String, String> response = new HashMap<>();
        try {
            customerService.save(employee);
            response.put("status", "ok");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, e.getMessage());
            response.put("status", "error");
        }
        return response;
    }
}
