package com.romanvoloboev.service;

import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.SimpleDTO;
import com.romanvoloboev.repository.AddressRepository;
import com.romanvoloboev.repository.CustomerRepository;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;
import com.romanvoloboev.dto.AddressDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class CustomerServiceImpl implements CustomerService {
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁa-zA-Z ]+$";

    @Autowired private CustomerRepository customerRepository;
    @Autowired private AddressService addressService;
    @Autowired private AddressRepository addressRepository;
    @Autowired private CustomerDetailsService detailsService;
    @Qualifier("authenticationManager")
    @Autowired private AuthenticationManager authenticationManager;


    @Transactional
    @Override
    public void save(Customer customer) throws Exception {
        customerRepository.save(customer);
    }

    @Transactional
    @Override
    public void delete(Customer customer) throws Exception {
        customerRepository.delete(customer);
    }

    @Transactional
    @Override
    public void delete(Integer id) throws Exception {
        customerRepository.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectModel(String email) throws Exception {
        return customerRepository.getByEmailIgnoreCase(email);
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectModel(Integer id) throws Exception {
        return customerRepository.findOne(id);
    }

    @Transactional
    @Override
    public void save(CustomerDTO customerDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(customerDTO, validator)) {
            Customer customer;
            if (customerDTO.getId() == 0) {
                customer = new Customer(customerDTO.getName(), customerDTO.getEmail(),
                        customerDTO.getPassword(), stringToPhone(customerDTO.getPhone()), true,
                        getRoleFromDTO(customerDTO.getRole()), null, null, null, null);
            } else {
                customer = selectModel(customerDTO.getId());
                customer = new Customer(customerDTO.getId(), customerDTO.getName(), customerDTO.getEmail(),
                        customerDTO.getPassword(), stringToPhone(customerDTO.getPhone()), customer.isActive(),
                        getRoleFromDTO(customerDTO.getRole()), customer.getWishes(), customer.getReviews(), customer.getBookings(), customer.getAddresses());
            }
            customerRepository.save(customer);
        }
    }

    @Transactional
    @Override
    public CustomerDTO prepareDTO(Customer customer, String name, String phone, String city, String street,
                                  String house, String flat) throws Exception {
        List<AddressDTO> addressDTOs = null;
        if (name.equals("")) name = customer.getName();
        if (phone.equals("")) phone = customer.getPhone();
        if(!city.equals("") && !street.equals("") && !house.equals("")) {
            AddressDTO addressDTO = new AddressDTO(city, street, house, flat);
            if (addressService.isValid(addressDTO)) {
                addressDTOs = new ArrayList<>();
                addressDTOs.add(addressDTO);
            }
        }
        return new CustomerDTO(customer.getId(), name, customer.getEmail(), customer.getPassword(), stringToPhone(phone),
                customer.isActive(), getRoleFromModel(customer.getRole()), addressDTOs);
    }

    @Transactional(readOnly = true)
    @Override
    public List<SimpleDTO> selectSimpleDTOsByName(String name, short role) throws Exception {
        List<Customer> customers = selectModelsByNameContainsAndRole(name, getRoleFromDTO(role));
        List<SimpleDTO> simpleDTOs = new ArrayList<>();
        if (customers != null) {
            for (Customer customer:customers) {
                simpleDTOs.add(new SimpleDTO(customer.getId(), customer.getName()));
            }
        }
        return simpleDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<Customer> selectModelsByNameContainsAndRole(String name, Role role) throws Exception {
        return customerRepository.getByNameContainsIgnoreCaseAndRole(name, role);
    }

    @Transactional(readOnly = true)
    @Override
    public List<SimpleDTO> selectSimpleDTOsByEmail(String email, short role) throws Exception {
        List<Customer> customers = selectModelsByEmailContainsAndRole(email, getRoleFromDTO(role));
        List<SimpleDTO> simpleDTOs = new ArrayList<>();
        if (customers != null) {
            for (Customer customer:customers) {
                simpleDTOs.add(new SimpleDTO(customer.getId(), customer.getEmail()));
            }
        }
        return simpleDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<Customer> selectModelsByEmailContainsAndRole(String email, Role role) throws Exception{
        return customerRepository.getByEmailContainsAndRole(email, role);
    }

    @Transactional(readOnly = true)
    @Override
    public List<CustomerDTO> selectCustomerDTOs() throws Exception {
        List<Customer> customers = selectCustomerModels();
        List<CustomerDTO> customerDTOs = new ArrayList<>();
        if (customers != null) {
            for (Customer customer:customers) {
                customerDTOs.add(new CustomerDTO(customer.getId(), customer.getName(), customer.getEmail(),
                        phoneToString(customer.getPhone()), customer.isActive(), getReviewsCount(customer.getId())));
            }
        }
        return customerDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public List<CustomerDTO> selectEmployeeDTOs() throws Exception {
        List<Customer> customers = selectEmployeesModels();
        List<CustomerDTO> employeeDTO = new ArrayList<>();
        if (customers != null) {
            for (Customer customer:customers) {
                employeeDTO.add(new CustomerDTO(customer.getId(), customer.getName(), customer.getEmail(),
                        phoneToString(customer.getPhone()), customer.isActive(), getTypeByRole(customer.getRole())));
            }
        }
        return employeeDTO;
    }

    @Transactional(readOnly = true)
    @Override
    public long getReviewsCount(Integer id) throws Exception {
        return addressRepository.getCountByCustomerId(id);
    }

    @Transactional
    @Override
    public void changeCustomerStatus(Integer id) throws Exception {
        Customer customer = selectModel(id);
        if (customer.isActive()) {
            customer.setActive(false);
        } else {
            customer.setActive(true);
        }
        save(customer);
    }

    @Transactional(readOnly = true)
    @Override
    public List<CustomerDTO> selectDTO(Integer id) throws Exception {
        Customer customer = customerRepository.findOne(id);
        List<CustomerDTO> customerDTOs = new ArrayList<>();
        customerDTOs.add(new CustomerDTO(customer.getId(), customer.getName(), customer.getEmail(), phoneToString(customer.getPhone()), customer.isActive(), getReviewsCount(customer.getId())));
        return customerDTOs;
    }

    @Transactional(readOnly = true)
    @Override
    public CustomerDTO selectDTObyId(Integer id) throws Exception {
        Customer customer = selectModel(id);
        return new CustomerDTO(customer.getId(), customer.getName(), customer.getEmail(), customer.getPhone(), customer.getPassword(), getRoleFromModel(customer.getRole()));
    }

    @Transactional
    @Override
    public boolean changeEmployeeStatus(Integer id) throws Exception {
        if (hasRole("ROLE_ADMIN")) {
            Customer customer = selectModel(id);
            if (customer.isActive()) {
                customer.setActive(false);
            } else {
                customer.setActive(true);
            }
            return true;
        } else {
            return false;
        }
    }

    @Transactional
    @Override
    public boolean deleteEmployee(Integer id) throws Exception {
        if (hasRole("ROLE_ADMIN")) {
            delete(id);
            return true;
        } else {
            return false;
        }
    }

    @Transactional(readOnly = true)
    @Override
    public List<Customer> selectCustomerModels() throws Exception {
        return customerRepository.getAllCustomers();
    }

    @Transactional(readOnly = true)
    @Override
    public List<Customer> selectEmployeesModels() throws Exception {
        return customerRepository.getAllEmployees();
    }

    @Transactional
    @Override
    public void updateProfile(CustomerDTO customerDTO, Customer customer) throws Exception {
        if (customerDTO == null) throw new Exception();
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if(validate(customerDTO, validator)) {
            customer.setName(customerDTO.getName());
            if (!customerDTO.getPhone().equals("")) {
                customer.setPhone(customerDTO.getPhone());
            }
            List<AddressDTO> addressDTOs = customerDTO.getAddressesList();
            if(addressDTOs != null) {
                Address address;
                for (AddressDTO addressDTO : addressDTOs) {
                    address = new Address(addressDTO.getCity(), addressDTO.getStreet(), addressDTO.getHouse(),
                            addressDTO.getFlat(), customer);
                    addressService.save(address);
                }
            }
            customerRepository.save(customer);
        }
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectAuth() {
        try {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            return selectModel(userDetails.getUsername());
        } catch (Exception e){
            return null;
        }
    }

    @Transactional(readOnly = true)
    @Override
    public CustomerDTO selectSimpleDto(Customer customer) throws Exception {
        if (customer == null) {
            return null;
        } else {
            return new CustomerDTO(customer.getId(), customer.getName(), customer.getEmail(),
                    phoneToString(customer.getPhone()), addressService.selectDTOs(customer));
        }
    }

    public boolean hasRole(String role) {
        SecurityContext context = SecurityContextHolder.getContext();
        if (context == null) return false;

        Authentication authentication = context.getAuthentication();
        if (authentication == null) return false;

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        return authorities.contains(new SimpleGrantedAuthority(role));
    }

    @Transactional
    @Override
    public Map<String, String> registerCustomer(CustomerDTO customerDTO, HttpServletRequest request) throws Exception{
        Map<String, String> response = new HashMap<>();
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(customerDTO, validator)) {
            if (selectModel(customerDTO.getEmail()) != null) {
                response.put("status", "exist");
            } else {
                save(new Customer(customerDTO.getName(), customerDTO.getEmail(), customerDTO.getPassword(), "", true, Role.CUSTOMER, null, null, null, null));
                try {
                    UserDetails user = detailsService.loadUserByUsername(customerDTO.getEmail());
                    if (autoLogin(user, request))
                        response.put("status", "ok");
                } catch (AuthenticationException e) {
                    e.printStackTrace();
                }
            }
        }
        return response;
    }

    private boolean autoLogin(UserDetails user, HttpServletRequest request) {
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
        request.getSession();
        token.setDetails(new WebAuthenticationDetails(request));
        Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return true;
    }

    private Role getRoleFromDTO(short role) {
        switch (role) {
            case 2:
                return Role.EMPLOYEE;
            case 3:
                return Role.ADMIN;
            default:
                return Role.CUSTOMER;
        }
    }

    private short getRoleFromModel(Role role) {
        switch (role) {
            case EMPLOYEE:
                return 2;
            case ADMIN:
                return 3;
            default:
                return 1;
        }
    }

    private String getTypeByRole(Role role) {
        switch (role) {
            case EMPLOYEE:
                return "Сотрудник";
            case ADMIN:
                return "Администратор";
            default:
                return "Пользователь";
        }
    }

    private String phoneToString(String phone) {
        if (!phone.equals("")) {
            phone = "+" + phone.substring(0, 2) + "(" + phone.substring(2, 5) + ")" +
                    phone.substring(5, 8) + "-" + phone.substring(8, 10) + "-" + phone.substring(10);
        }
        return phone;
    }

    private String stringToPhone(String phone) {
        if (!phone.equals("")) {
            return phone.replace("+", "").replace("(", "").replace(")", "").replace("-", "").replace("-", "");
        }
        return phone;
    }

    private boolean validate(Object object, Validator validator) throws ValidationException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);

        if (constraintViolations.size() > 0){
            StringBuilder errorString = new StringBuilder();
            for (ConstraintViolation<Object> cv : constraintViolations){
                errorString.append(String.format("Format error in property: [%s], value: [%s], message: [%s]",
                        cv.getPropertyPath(), cv.getInvalidValue(), cv.getMessage()));
            }
            throw new ValidationException(errorString.toString());
        }
        return true;
    }

}
