package com.romanvoloboev.model;

import com.romanvoloboev.service.CustomerBOImpl;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * @author Roman Voloboev
 */


public class SimpleCustomerModel {
    private int id;
    private String name;
    private String email;
    private String phone;

    public SimpleCustomerModel(int id, String name, String email, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Length(min = 1, max = 50)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @NotNull
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    @Pattern(regexp = CustomerBOImpl.PHONE_PATTERN)
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
}
