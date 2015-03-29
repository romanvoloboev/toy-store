package com.romanvoloboev.service;

import com.romanvoloboev.bo.UserBO;
import com.romanvoloboev.dao.DAOImpl;
import com.romanvoloboev.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Roman Voloboev
 */

@Service
public class UserBOImpl implements UserBO {
    @Qualifier("DAOImpl")
    @Autowired private DAOImpl dao;

    @Transactional
    @Override
    public void save(User user) throws Exception {
        dao.save(user);
    }

    @Transactional
    @Override
    public void delete(User user) throws Exception {
        dao.delete(user);
    }

    @Transactional
    @Override
    public void update(User user) throws Exception {
        dao.update(user);
    }

    @Transactional(readOnly = true)
    @Override
    public User selectByEmail(String email) throws Exception {
        return (User) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().getNamedQuery(User.SELECT_BY_EMAIL)
                .setParameter("email", email.toLowerCase()).setMaxResults(1).list().get(0);
    }

    @Transactional(readOnly = true)
    @Override
    public User selectById(Integer id) throws Exception {
        return (User) dao.getHibernateTemplate().getSessionFactory().getCurrentSession().get(User.class, id);
    }
}
