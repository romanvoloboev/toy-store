package com.romanvoloboev.dto;

import com.romanvoloboev.service.BrandServiceImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * @author Roman Voloboev
 */

public class BrandDTO {
    private int id;
    private String name;
    private String country;
    private boolean active;
    private int[] products;

    public BrandDTO(int id, String name, String country) {
        this.id = id;
        this.name = name;
        this.country = country;
    }

    public BrandDTO(int id, String name, String country, boolean active) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.active = active;
    }

    @NotNull
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Pattern(regexp = BrandServiceImpl.NAME_PATTERN, message = "Incorrect name format")
    @Size(min = 3, max = 50, message = "Incorrect name length")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @NotNull
    @Pattern(regexp = BrandServiceImpl.NAME_PATTERN, message = "Incorrect country format")
    @Size(min = 3, max = 50, message = "Incorrect country length")
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }

    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    public int[] getProducts() {
        return products;
    }
    public void setProducts(int[] products) {
        this.products = products;
    }
}
