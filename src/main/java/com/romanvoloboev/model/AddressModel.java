package com.romanvoloboev.model;

import com.romanvoloboev.service.AddressBOImpl;

import javax.validation.constraints.Pattern;

/**
 * @author Roman Voloboev
 */

public class AddressModel {
    private int id;
    private String city;
    private String street;
    private String house;
    private String flat;

    public AddressModel(int id, String city, String street, String house, String flat) {
        this.id = id;
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
    }

    public AddressModel(String city, String street, String house, String flat) {
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @Pattern(regexp = AddressBOImpl.ADDRESS_PATTERN, message = "Incorrect city format")
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    @Pattern(regexp = AddressBOImpl.ADDRESS_PATTERN, message = "Incorrect street format")
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }

    @Pattern(regexp = "[\\d]{1,3}", message = "Incorrect house number")
    public String getHouse() {
        return house;
    }
    public void setHouse(String house) {
        this.house = house;
    }

    @Pattern(regexp = "[\\d]{1,3}|^$", message = "Incorrect flat number")
    public String getFlat() {
        return flat;
    }
    public void setFlat(String flat) {
        this.flat = flat;
    }

}
