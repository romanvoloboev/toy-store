package com.romanvoloboev.dto;

import com.romanvoloboev.service.CustomerServiceImpl;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */


public class SimpleCustomerDTO {
    private Integer id;
    private String name;
    private String email;
    private String phone;
    private List<AddressDTO> addressesList = new ArrayList<>();

    public SimpleCustomerDTO(Integer id, String name, String email, String phone, List<AddressDTO> addressesList) {
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
    @Pattern(regexp = CustomerServiceImpl.NAME_PATTERN, message = "Incorrect name format")
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

    @Pattern(regexp = CustomerServiceImpl.PHONE_PATTERN, message = "Incorrect phone format")
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<AddressDTO> getAddressesList() {
        return addressesList;
    }
    public void setAddressesList(List<AddressDTO> addressesList) {
        this.addressesList = addressesList;
    }
}
