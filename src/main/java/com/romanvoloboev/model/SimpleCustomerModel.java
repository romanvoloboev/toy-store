package com.romanvoloboev.model;

import com.romanvoloboev.service.CustomerBOImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */


public class SimpleCustomerModel {
    private Integer id;
    private String name;
    private String email;
    private String phone;
    private List<AddressModel> addressesList = new ArrayList<>();

    public SimpleCustomerModel(Integer id, String name, String email, String phone, List<AddressModel> addressesList) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.addressesList = addressesList;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Size(min = 3, max = 50, message = "Incorrect name length")
    @Pattern(regexp = CustomerBOImpl.NAME_PATTERN, message = "Incorrect name format")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    @Pattern(regexp = CustomerBOImpl.PHONE_PATTERN, message = "Incorrect phone format")
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<AddressModel> getAddressesList() {
        return addressesList;
    }
    public void setAddressesList(List<AddressModel> addressesList) {
        this.addressesList = addressesList;
    }
}
