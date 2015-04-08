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


public class CustomerModel {
    private int id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private boolean isActive;
    private short role;
    private List<AddressModel> addressesList = new ArrayList<>();

    public CustomerModel(int id, String name, String email, String password, String phone,
                         boolean isActive, short role, List<AddressModel> addressesList) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.isActive = isActive;
        this.role = role;
        this.addressesList = addressesList;
    }

    @NotNull
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
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

    @NotNull
    @Size(min = 6, max = 16, message = "Incorrect password")
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Pattern(regexp = CustomerBOImpl.PHONE_PATTERN)
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    @NotNull
    public boolean isActive() {
        return isActive;
    }
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @NotNull
    public short getRole() {
        return role;
    }
    public void setRole(short role) {
        this.role = role;
    }

    public List<AddressModel> getAddressesList() {
        return addressesList;
    }
    public void setAddressesList(List<AddressModel> addressesList) {
        this.addressesList = addressesList;
    }
}
