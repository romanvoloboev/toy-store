package com.romanvoloboev.bo;

import com.romanvoloboev.entity.User;

/**
 * @author Roman Voloboev
 * Customer service layer
 */

public interface UserBO {
    public void save(User user) throws Exception;
    public void delete(User user) throws Exception;
    public void update(User user) throws Exception;
    public User selectByEmail(String email) throws Exception;
    public User selectById(Integer id) throws Exception;

}
