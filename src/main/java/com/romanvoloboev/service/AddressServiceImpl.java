package com.romanvoloboev.service;

import com.romanvoloboev.repository.AddressRepository;
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
    public static final String ADDRESS_PATTERN = "^[а-яА-ЯёЁ., ]+$";

    @Qualifier("addressRepository")
    @Autowired private AddressRepository addressRepository;

    @Transactional
    @Override
    public void save(Address address) throws Exception {
        addressRepository.save(address);
    }

    @Transactional
    @Override
    public void save(List<Address> addresses) throws Exception {
        addressRepository.save(addresses);
    }

    @Transactional
    @Override
    public void delete(Address address) throws Exception {
        addressRepository.delete(address);
    }

    @Transactional(readOnly = true)
    @Override
    public Address selectModel(Integer id) throws Exception {
       return addressRepository.findOne(id);
    }

    @Transactional
    @Override
    public void removeCustomerAddress(Integer id, Customer customer) throws Exception {
        Address address = addressRepository.getByIdAndCustomer(id, customer);
        if (address != null) {
            delete(address);
        } else {
            throw new Exception("No specified customer address found");
        }
    }

    @Transactional(readOnly = true)
    @Override
    public List<Address> selectModelList(Customer customer) throws Exception {
        return addressRepository.getByCustomer(customer);
    }

    @Transactional
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

    @Transactional
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
