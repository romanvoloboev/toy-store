package com.romanvoloboev.dto;

import com.romanvoloboev.service.CustomerServiceImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public class CustomerDTO {
    private int id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private boolean isActive;
    private short role;
    private String type;
    private long reviewsCount;
    private List<AddressDTO> addressesList = new ArrayList<>();

    public CustomerDTO() {
    }

    public CustomerDTO(String name, String phone, List<AddressDTO> addressesList) {
        this.name = name;
        this.phone = phone;
        this.addressesList = addressesList;
    }

    public CustomerDTO(int id, String name, String email, String password, String phone, boolean isActive,
                       short role, List<AddressDTO> addressesList) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.isActive = isActive;
        this.role = role;
        this.addressesList = addressesList;
    }

    public CustomerDTO(int id, String name, String email, String phone, List<AddressDTO> addressesList) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.addressesList = addressesList;
    }

    public CustomerDTO(int id, String name, String email, String phone, boolean isActive, long reviewsCount) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.isActive = isActive;
        this.reviewsCount = reviewsCount;
    }

    public CustomerDTO(int id, String name, String email, String phone, boolean isActive, String type) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.isActive = isActive;
        this.type = type;
    }

    public CustomerDTO(int id, String name, String email, String phone, String password, short role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.role = role;
    }

    public CustomerDTO(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
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
    @Pattern(regexp = CustomerServiceImpl.NAME_PATTERN, message = "Incorrect name format")
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

    @NotNull
    @Size(min = 6, max = 16, message = "Incorrect password")
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

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

    public long getReviewsCount() {
        return reviewsCount;
    }
    public void setReviewsCount(long reviewsCount) {
        this.reviewsCount = reviewsCount;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public List<AddressDTO> getAddressesList() {
        return addressesList;
    }
    public void setAddressesList(List<AddressDTO> addressesList) {
        this.addressesList = addressesList;
    }
}
