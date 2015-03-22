package com.romanvoloboev.dao;

import org.springframework.stereotype.Repository;

/**
 * @author Roman Voloboev
 */

@Repository
public class DAOImpl extends CustomHibernateDaoSupport implements DAO {
    @Override
    public void save(Object o) throws Exception {
        getHibernateTemplate().save(o);
    }

    @Override
    public void delete(Object o) throws Exception {
        getHibernateTemplate().delete(o);
    }

    @Override
    public void saveOrUpdate(Object o) throws Exception {
        getHibernateTemplate().saveOrUpdate(o);
    }

    @Override
    public void update(Object o) throws Exception {
        getHibernateTemplate().update(o);
    }
}
