package com.romanvoloboev.service;

import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.dto.AddressDTO;
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
public class AddressServiceImpl implements AddressService {
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
    public void save(AddressDTO addressDTO) throws Exception {

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
    public Address selectModel(Integer id) throws Exception {
       return (Address) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Address.class, id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Address> selectModelList(Customer customer) throws Exception {
        return dao.getHibernateTemplate().getSessionFactory().getCurrentSession().
                getNamedQuery(Address.SELECT_BY_CUSTOMER).setParameter("email", customer.getEmail()).list();
    }

    @Override
    public List<AddressDTO> selectDtoList(Customer customer) throws Exception {
        List<Address> addresses = selectModelList(customer);
        List<AddressDTO> addressDTOs = new ArrayList<>();
        for (Address address : addresses) {
            addressDTOs.add(new AddressDTO(address.getId(), address.getCity(), address.getStreet(),
                    address.getHouse(), address.getFlat()));
        }
        return addressDTOs;
    }

    @Override
    public List<Address> selectModelList(List<AddressDTO> addressDTOList) throws Exception {
        List<Address> addresses = new ArrayList<>();
        for (AddressDTO addressDTO : addressDTOList) {
            addresses.add(new Address(addressDTO.getCity(), addressDTO.getStreet(),
                    addressDTO.getHouse(), addressDTO.getFlat(), null));
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

    @Override
    public boolean isValid(AddressDTO addressDTO) throws ValidationException {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        return validate(addressDTO, validator);
    }

}
