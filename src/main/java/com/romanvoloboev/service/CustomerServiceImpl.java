package com.romanvoloboev.service;

import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.enums.Role;
import com.romanvoloboev.dto.AddressDTO;
import com.romanvoloboev.dto.CustomerDTO;
import com.romanvoloboev.dto.SimpleCustomerDTO;
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
import java.util.List;
import java.util.Set;

/**
 * @author Roman Voloboev
 */

@Service
public class CustomerServiceImpl implements CustomerService {
    public static final String PHONE_PATTERN = "\\d{12}";
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁa-zA-Z ]+$";

    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Autowired private AddressService addressService;

    @Transactional
    @Override
    public void save(Customer customer) throws Exception {
        dao.save(customer);
    }

    @Transactional
    @Override
    public void delete(Customer customer) throws Exception {
        dao.delete(customer);
    }

    @Transactional
    @Override
    public void update(Customer customer) throws Exception {
        dao.update(customer);
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectModel(String email) throws Exception {
        try {
            return (Customer) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().getNamedQuery(Customer.SELECT_BY_EMAIL)
                    .setParameter("email", email.toLowerCase()).setMaxResults(1).list().get(0);
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectModel(Integer id) throws Exception {
        return (Customer) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Customer.class, id);
    }

    //method for control panel customer adding...
    @Transactional
    @Override
    public void saveByModel(CustomerDTO customerDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

        if (validate(customerDTO, validator)) {
            Customer customer = new Customer(customerDTO.getName(), customerDTO.getEmail(),
                        customerDTO.getPassword(), customerDTO.getPhone(), customerDTO.isActive(),
                        getRoleFromModel(customerDTO.getRole()), null, null, null, null);

            if(customerDTO.getAddressesList() != null) {
                customer.setAddresses(addressService.selectModelList(customerDTO.getAddressesList()));
            }
            dao.saveOrUpdate(customer);
        }
    }


    @Transactional
    @Override
    public void update(SimpleCustomerDTO simpleCustomerDTO, Customer customer) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if(validate(simpleCustomerDTO, validator)) {
            customer.setName(simpleCustomerDTO.getName());
            if (!simpleCustomerDTO.getPhone().equals("")) {
                customer.setPhone(simpleCustomerDTO.getPhone());
            }
            List<AddressDTO> addressDTOs = simpleCustomerDTO.getAddressesList();
            if(addressDTOs != null) {
                Address address;
                for (AddressDTO addressDTO : addressDTOs) {
                    address = new Address(addressDTO.getCity(), addressDTO.getStreet(), addressDTO.getHouse(), addressDTO.getFlat(), customer);
                    addressService.save(address);
                }
            }
            dao.update(customer);
        } else {
            throw new ValidationException();
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

    @Transactional
    @Override
    public SimpleCustomerDTO selectDto(Customer customer) throws Exception {
        if (customer == null) {
            return null;
        } else {
            return new SimpleCustomerDTO(customer.getId(), customer.getName(), customer.getEmail(),
                    phoneToString(customer.getPhone()), addressService.selectDtoList(customer));
        }
    }

    public Role getRoleFromModel(short role) throws Exception {
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

    public String phoneToString(String phone) {
        return "+" + phone.substring(0, 2) + "(" + phone.substring(2, 5) + ")" +
                phone.substring(5, 8) + "-" + phone.substring(8, 10) + "-" + phone.substring(10);
    }

    public String stringToPhone(String phone) {
        return phone.replace("+", "").replace("(", "").replace(")", "").replace("-", "").replace("-", "");
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
