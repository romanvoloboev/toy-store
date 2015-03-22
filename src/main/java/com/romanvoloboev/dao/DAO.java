package com.romanvoloboev.dao;

/**
 * @author Roman Voloboev
 */
public interface DAO {
    public void save(Object o) throws Exception;
    public void delete(Object o) throws Exception;
    public void saveOrUpdate(Object o) throws Exception;
    public void update(Object o) throws Exception;
}
