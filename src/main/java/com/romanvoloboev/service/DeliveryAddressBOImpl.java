package com.romanvoloboev.service;

import com.romanvoloboev.bo.DeliveryAddressBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.Customer;
import com.romanvoloboev.entity.DeliveryAddress;
import com.romanvoloboev.model.SimpleDeliveryAddressModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class DeliveryAddressBOImpl implements DeliveryAddressBO {
    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Transactional
    @Override
    public void save(DeliveryAddress deliveryAddress) throws Exception {
        dao.save(deliveryAddress);
    }

    @Transactional
    @Override
    public void save(SimpleDeliveryAddressModel simpleDeliveryAddressModel) throws Exception {

    }

    @Transactional
    @Override
    public void delete(DeliveryAddress deliveryAddress) throws Exception {
        dao.delete(deliveryAddress);
    }

    @Transactional
    @Override
    public void update(DeliveryAddress deliveryAddress) throws Exception {
        dao.update(deliveryAddress);
    }

    @Transactional(readOnly = true)
    @Override
    public DeliveryAddress selectEntityById(Integer id) throws Exception {
       return (DeliveryAddress) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(DeliveryAddress.class, id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<SimpleDeliveryAddressModel> makeSimpleModelList(Customer customer) throws Exception {
        List<DeliveryAddress> deliveryAddresses = dao.getHibernateTemplate().getSessionFactory().getCurrentSession()
                .getNamedQuery(DeliveryAddress.SELECT_BY_CUSTOMER).setParameter("email", customer.getEmail()).list();

        List<SimpleDeliveryAddressModel> simpleDeliveryAddressModels = new ArrayList<>();

        for (DeliveryAddress deliveryAddress : deliveryAddresses) {
            StringBuilder sb = new StringBuilder();
            if (deliveryAddress.getFlat() != null) {
                sb.append("г. ").append(deliveryAddress.getCity()).append(", ул. ")
                        .append(deliveryAddress.getStreet()).append(", д. ")
                        .append(deliveryAddress.getHouse()).append(", кв. ")
                        .append(deliveryAddress.getFlat());
            } else {
                sb.append("г. ").append(deliveryAddress.getCity()).append(", ул. ")
                        .append(deliveryAddress.getStreet()).append(", д. ")
                        .append(deliveryAddress.getHouse());
            }
            simpleDeliveryAddressModels.add(new SimpleDeliveryAddressModel(deliveryAddress.getId(), sb.toString()));
        }
        return simpleDeliveryAddressModels;
    }

}
