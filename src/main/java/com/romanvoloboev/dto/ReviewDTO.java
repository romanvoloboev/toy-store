package com.romanvoloboev.dto;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * @author Roman Voloboev
 */

public class ReviewDTO {
    private int id;
    private String comment;
    private float rating;
    private String date;
    private boolean active;
    private int customer;
    private int product;
    private String customerName;
    private String productName;

    public ReviewDTO() {
    }

    public ReviewDTO(String comment, float rating, int customer, int product) {
        this.comment = comment;
        this.rating = rating;
        this.customer = customer;
        this.product = product;
    }

    public ReviewDTO(String comment, float rating, int product) {
        this.comment = comment;
        this.rating = rating;
        this.product = product;
    }

    public ReviewDTO(int id, String comment, float rating, String date, boolean active, String customerName, String productName, int product) {
        this.id = id;
        this.comment = comment;
        this.rating = rating;
        this.date = date;
        this.active = active;
        this.customerName = customerName;
        this.productName = productName;
        this.product = product;
    }

    public ReviewDTO(int id, String comment, float rating) {
        this.id = id;
        this.comment = comment;
        this.rating = rating;
    }

    public ReviewDTO(String comment, String date, String customerName, float rating) {
        this.comment = comment;
        this.date = date;
        this.customerName = customerName;
        this.rating = rating;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Size(min = 3, max = 500, message = "Incorrect comment length")
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }

    @NotNull
    public float getRating() {
        return rating;
    }
    public void setRating(float rating) {
        this.rating = rating;
    }

    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    @DateTimeFormat(pattern = "MM/dd/yyyy")
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    public int getCustomer() {
        return customer;
    }
    public void setCustomer(int customer) {
        this.customer = customer;
    }

    @NotNull
    public int getProduct() {
        return product;
    }
    public void setProduct(int product) {
        this.product = product;
    }

    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
}
