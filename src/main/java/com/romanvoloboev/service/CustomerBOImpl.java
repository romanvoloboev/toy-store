package com.romanvoloboev.service;

import com.romanvoloboev.bo.CustomerBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Roman Voloboev
 */

@Service
public class CustomerBOImpl implements CustomerBO {
    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

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
    public Customer selectByEmail(String email) throws Exception {
        return (Customer) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().getNamedQuery(Customer.SELECT_BY_EMAIL)
                .setParameter("email", email.toLowerCase()).setMaxResults(1).list().get(0);
    }

    @Transactional(readOnly = true)
    @Override
    public Customer selectById(Integer id) throws Exception {
        return (Customer) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Customer.class, id);
    }
}
