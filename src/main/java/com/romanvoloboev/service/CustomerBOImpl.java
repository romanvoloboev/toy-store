package com.romanvoloboev.service;

import com.romanvoloboev.bo.CustomerBO;
import com.romanvoloboev.bo.DeliveryAddressBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.Customer;
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
import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class CustomerBOImpl implements CustomerBO {
    Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
    public static final String PHONE_PATTERN = "\\d{12}|^$";

    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Autowired private DeliveryAddressBO deliveryAddressBO;

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

    @Override
    public void save(SimpleCustomerModel simpleCustomerModel) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

//        if (validate(customerModel, validator)) {
//            if (customerModel.getPhone().replaceAll("\\s*", "\\s").equals("\\s"))
//        }
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

    @Transactional(readOnly = true)
    @Override
    public SimpleCustomerModel makeSimpleModel(Customer customer) throws Exception {
        if (customer == null) {
            return null;
        } else {
            return new SimpleCustomerModel(customer.getId(), customer.getName(), customer.getEmail(),
                    customer.getPhone());
        }
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
