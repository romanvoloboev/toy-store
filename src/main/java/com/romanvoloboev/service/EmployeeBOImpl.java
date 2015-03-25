package com.romanvoloboev.service;

import com.romanvoloboev.bo.EmployeeBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Roman Voloboev
 */

@Service
public class EmployeeBOImpl implements EmployeeBO {
    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Transactional
    @Override
    public void save(Employee employee) throws Exception {
        dao.save(employee);
    }

    @Transactional
    @Override
    public void delete(Employee employee) throws Exception {
        dao.delete(employee);
    }

    @Transactional
    @Override
    public void update(Employee employee) throws Exception {
        dao.update(employee);
    }

    @Transactional(readOnly = true)
    @Override
    public Employee select(Integer id) throws Exception {
        return (Employee) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Employee.class, id);
    }

    @Transactional(readOnly = true)
    @Override
    public Employee select(String login) throws Exception {
        return (Employee) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().getNamedQuery(Employee.SELECT_BY_LOGIN)
                .setParameter("login", login.toLowerCase()).setMaxResults(1).list().get(0);
    }
}
