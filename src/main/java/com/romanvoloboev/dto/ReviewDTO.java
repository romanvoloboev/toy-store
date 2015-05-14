package com.romanvoloboev.dto;

import com.romanvoloboev.service.ReviewServiceImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * @author Roman Voloboev
 */

public class ReviewDTO {
    private int id;
    private String comment;
    private float rating;
    private String date;
    private String customer;

    public ReviewDTO(int id, String comment, float rating, String date, String customer) {
        this.id = id;
        this.comment = comment;
        this.rating = rating;
        this.date = date;
        this.customer = customer;
    }

    public ReviewDTO(int id, String comment, float rating) {
        this.id = id;
        this.comment = comment;
        this.rating = rating;
    }

    @NotNull
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
    @Size(min = 1, max = 3, message = "Incorrect rating length")
    @Pattern(regexp = ReviewServiceImpl.FLOAT_PATTERN, message = "Incorrect rating format")
    public float getRating() {
        return rating;
    }
    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    public String getCustomer() {
        return customer;
    }
    public void setCustomer(String customer) {
        this.customer = customer;
    }
}
