package com.romanvoloboev.service;

import com.romanvoloboev.bo.AddressBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.Address;
import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.model.AddressModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidationException;
import javax.validation.Validator;
import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class AddressBOImpl implements AddressBO {
    public static final String ADDRESS_PATTERN = "^[а-яА-ЯёЁa-zA-Z ]+$";

    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Transactional
    @Override
    public void save(Address address) throws Exception {
        dao.save(address);
    }

    @Transactional
    @Override
    public void save(AddressModel addressModel) throws Exception {

    }

    @Transactional
    @Override
    public void delete(Address address) throws Exception {
        dao.delete(address);
    }

    @Transactional
    @Override
    public void update(Address address) throws Exception {
        dao.update(address);
    }

    @Transactional(readOnly = true)
    @Override
    public Address selectEntityById(Integer id) throws Exception {
       return (Address) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Address.class, id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Address> selectAddressesList(Customer customer) throws Exception {
        return dao.getHibernateTemplate().getSessionFactory().getCurrentSession().
                getNamedQuery(Address.SELECT_BY_CUSTOMER).setParameter("email", customer.getEmail()).list();
    }

    @Transactional(readOnly = true)
    @Override
    public List<AddressModel> makeModelList(Customer customer) throws Exception {
        List<Address> addresses = selectAddressesList(customer);
        List<AddressModel> addressModels = new ArrayList<>();
        for (Address address : addresses) {
            addressModels.add(new AddressModel(address.getId(), address.getCity(), address.getStreet(),
                    address.getHouse(), address.getFlat()));
        }
        return addressModels;
    }



    public boolean isValid(AddressModel addressModel) throws ValidationException {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        return validate(addressModel, validator);
    }

    public List<Address> makeEntityList(List<AddressModel> addressModelList) throws Exception {
        List<Address> addresses = new ArrayList<>();
        for (AddressModel addressModel: addressModelList) {
            addresses.add(new Address(addressModel.getCity(), addressModel.getStreet(),
                    addressModel.getHouse(), addressModel.getFlat(), null));
        }
        return addresses;
    }

    private boolean validate(Object object, Validator validator) throws ValidationException {
        Set<ConstraintViolation<Object>> constraintViolations = validator.validate(object);

        if (constraintViolations.size() > 0) {
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
