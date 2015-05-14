package com.romanvoloboev.service;

import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.dto.AddressDTO;

import javax.validation.ValidationException;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface AddressService {
    void save(Address address) throws Exception;
    void save(List<Address> addresses) throws Exception;
    void delete(Address address) throws Exception;
    Address selectModel(Integer id) throws Exception;
    List<Address> selectModels(Customer customer) throws Exception;
    List<Address> selectModels(List<AddressDTO> addressDTOList) throws Exception;
    List<AddressDTO> selectDTOs(Customer customer) throws Exception;
    boolean isValid(AddressDTO addressDTO) throws ValidationException;
    void removeCustomerAddress(Integer id, Customer customer) throws Exception;
}
