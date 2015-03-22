package com.romanvoloboev.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 * @author Roman Voloboev
 */
public abstract class CustomHibernateDaoSupport extends HibernateDaoSupport {
    @Autowired
    public void createSessionFactory(SessionFactory sessionFactory) {
        setSessionFactory(sessionFactory);
    }
}
