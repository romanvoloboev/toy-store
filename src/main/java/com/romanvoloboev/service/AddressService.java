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
    void save(AddressDTO addressDTO) throws Exception;
    void delete(Address address) throws Exception;
    void update(Address address) throws Exception;
    Address selectModel(Integer id) throws Exception;
    List<Address> selectModelList(Customer customer) throws Exception;
    List<Address> selectModelList(List<AddressDTO> addressDTOList) throws Exception;
    List<AddressDTO> selectDtoList(Customer customer) throws Exception;
    boolean isValid(AddressDTO addressDTO) throws ValidationException;
}
