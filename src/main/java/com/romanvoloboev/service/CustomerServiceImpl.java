package com.romanvoloboev.service;

import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.repository.CustomerRepository;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;
import com.romanvoloboev.dto.AddressDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

@Service
public class CustomerServiceImpl implements CustomerService {
    public static final String PHONE_PATTERN = "(^$|^\\d{12}$)";
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁa-zA-Z ]+$";

    @Qualifier("customerRepository")
    @Autowired private CustomerRepository customerRepository;

    @Autowired private AddressService addressService;

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

    //method for control panel customer adding...
    @Transactional
    @Override
    public void saveByDTO(CustomerDTO customerDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

        if (validate(customerDTO, validator)) {
            Customer customer = new Customer(customerDTO.getName(), customerDTO.getEmail(),
                    customerDTO.getPassword(), customerDTO.getPhone(), customerDTO.isActive(),
                    getRoleFromDTO(customerDTO.getRole()), null, null, null, null);

            if(customerDTO.getAddressesList() != null) {
                customer.setAddresses(addressService.selectModelList(customerDTO.getAddressesList()));
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
                    phoneToString(customer.getPhone()), addressService.selectDtoList(customer));
        }
    }

    private Role getRoleFromDTO(short role) {
        switch (role) {
            case 1:
                return Role.CUSTOMER;
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
            case CUSTOMER:
                return 1;
            case EMPLOYEE:
                return 2;
            case ADMIN:
                return 3;
            default:
                return 1;
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
