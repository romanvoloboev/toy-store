package com.romanvoloboev.service;

import com.romanvoloboev.dto.json.JSONResponseDTO;
import com.romanvoloboev.model.Address;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.dto.AddressDTO;

import javax.validation.ValidationException;
import java.util.List;
import java.util.Map;

/**
 * @author Roman Voloboev
 */

public interface AddressService {
    void save(Address address) throws Exception;
    void save(List<Address> addresses) throws Exception;
    void delete(Address address) throws Exception;
    Address selectModel(Integer id) throws Exception;
    List<Address> selectModels(List<AddressDTO> addressDTOList);
    List<AddressDTO> selectDTOs(Integer id);
    boolean isValid(AddressDTO addressDTO) throws ValidationException;
    void removeCustomerAddress(Integer id, Customer customer) throws Exception;
    List<String> selectNovaposhtaOffices(String city);
}
