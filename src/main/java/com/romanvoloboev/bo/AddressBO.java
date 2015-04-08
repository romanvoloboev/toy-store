package com.romanvoloboev.bo;

import com.romanvoloboev.entity.Address;
import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.model.AddressModel;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface AddressBO {
    public void save(Address address) throws Exception;
    public void save(AddressModel addressModel) throws Exception;
    public void delete(Address address) throws Exception;
    public void update(Address address) throws Exception;
    public Address selectEntityById(Integer id) throws Exception;
    public List<Address> selectAddressesList(Customer customer) throws Exception;
    public List<AddressModel> makeModelList(Customer customer) throws Exception;
    public List<Address> makeEntityList(List<AddressModel> addressModelList) throws Exception;
}
