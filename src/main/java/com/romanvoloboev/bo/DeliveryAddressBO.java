package com.romanvoloboev.bo;

import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.entity.DeliveryAddress;
import com.romanvoloboev.model.SimpleDeliveryAddressModel;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface DeliveryAddressBO {
    public void save(DeliveryAddress deliveryAddress) throws Exception;
    public void save(SimpleDeliveryAddressModel simpleDeliveryAddressModel) throws Exception;
    public void delete(DeliveryAddress deliveryAddress) throws Exception;
    public void update(DeliveryAddress deliveryAddress) throws Exception;
    public DeliveryAddress selectEntityById(Integer id) throws Exception;
    public List<SimpleDeliveryAddressModel> makeSimpleModelList(Customer customer) throws Exception;
}
