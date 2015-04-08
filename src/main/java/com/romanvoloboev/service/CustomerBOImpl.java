package com.romanvoloboev.service;

import com.romanvoloboev.bo.CustomerBO;
import com.romanvoloboev.bo.AddressBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.Address;
import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.entity.Role;
import com.romanvoloboev.model.AddressModel;
import com.romanvoloboev.model.CustomerModel;
import com.romanvoloboev.model.SimpleCustomerModel;
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
public class CustomerBOImpl implements CustomerBO {
    public static final String PHONE_PATTERN = "\\d{12}";
    public static final String NAME_PATTERN = "^[а-яА-ЯёЁa-zA-Z ]+$";

    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Autowired private AddressBO addressBO;

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
    public Customer selectEntityByEmail(String email) throws Exception {
        try {
            return (Customer) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().getNamedQuery(Customer.SELECT_BY_EMAIL)
                    .setParameter("email", email.toLowerCase()).setMaxResults(1).list().get(0);
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectEntityById(Integer id) throws Exception {
        return (Customer) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Customer.class, id);
    }

    //method for control panel customer adding...
    @Transactional
    @Override
    public void saveByModel(CustomerModel customerModel) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

        if (validate(customerModel, validator)) {
            Customer customer = new Customer(customerModel.getName(), customerModel.getEmail(),
                        customerModel.getPassword(), customerModel.getPhone(), customerModel.isActive(),
                        getRoleFromModel(customerModel.getRole()), null, null, null, null);

            if(customerModel.getAddressesList() != null) {
                customer.setAddresses(addressBO.makeEntityList(customerModel.getAddressesList()));
            }
            dao.saveOrUpdate(customer);
        }
    }


    @Transactional
    @Override
    public void updateCustomerProfile(SimpleCustomerModel simpleCustomerModel, Customer customer) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if(validate(simpleCustomerModel, validator)) {
            customer.setName(simpleCustomerModel.getName());
            if (!simpleCustomerModel.getPhone().equals("")) {
                customer.setPhone(simpleCustomerModel.getPhone());
            }
            List<AddressModel> addressModels = simpleCustomerModel.getAddressesList();
            if(addressModels != null) {
                Address address;
                for (AddressModel addressModel : addressModels) {
                    address = new Address(addressModel.getCity(), addressModel.getStreet(), addressModel.getHouse(), addressModel.getFlat(), customer);
                    addressBO.save(address);
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
            return selectEntityByEmail(userDetails.getUsername());
        } catch (Exception e){
            return null;
        }
    }

    @Transactional
    @Override
    public SimpleCustomerModel makeModel(Customer customer) throws Exception {
        if (customer == null) {
            return null;
        } else {
            return new SimpleCustomerModel(customer.getId(), customer.getName(), customer.getEmail(),
                    phoneToText(customer.getPhone()), addressBO.makeModelList(customer));
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

    public String phoneToText(String phone) {
        return "+" + phone.substring(0, 2) + "(" + phone.substring(2, 5) + ")" +
                phone.substring(5, 8) + "-" + phone.substring(8, 10) + "-" + phone.substring(10);
    }

    public String textToPhone(String phone) {
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
