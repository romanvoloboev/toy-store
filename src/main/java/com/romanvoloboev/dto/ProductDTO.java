package com.romanvoloboev.dto;

import com.romanvoloboev.service.ProductServiceImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public class ProductDTO {
    private int id;
    private String name;
    private String description;
    private String date;
    private short quantity;
    private String code;
    private float price;
    private float oldPrice;
    private short allowAge;
    private boolean isActive;
    private float rating;
    private short width;
    private short height;
    private short length;
    private int brand;
    private int subcategory;
    private int[] images;
    private List<ReviewDTO> reviewsList = new ArrayList<>();

    public ProductDTO(int id, String name, String description, String date, short quantity, String code, float price,
                      float oldPrice, short allowAge, boolean isActive, short width, short height, short length, int brand, int subcategory, int[] images) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.oldPrice = oldPrice;
        this.allowAge = allowAge;
        this.isActive = isActive;
        this.width = width;
        this.height = height;
        this.length = length;
        this.brand = brand;
        this.subcategory = subcategory;
        this.images = images;
    }

    public ProductDTO(int id, String name, String description, String date, short quantity, String code, float price,
                      float oldPrice, short allowAge, boolean isActive, float rating, short width, short height, short length, int brand, int subcategory, int[] images, List<ReviewDTO> reviewsList) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.oldPrice = oldPrice;
        this.allowAge = allowAge;
        this.isActive = isActive;
        this.rating = rating;
        this.width = width;
        this.height = height;
        this.length = length;
        this.brand = brand;
        this.subcategory = subcategory;
        this.images = images;
        this.reviewsList = reviewsList;
    }

    @NotNull
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.NAME_PATTERN, message = "Incorrect name format")
    @Size(min = 3, max = 50, message = "Incorrect name length")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @NotNull
    @Size(min = 3, max = 2000, message = "Incorrect description length")
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @NotNull
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect quantity format")
    @Size(min = 1, max = 3, message = "Incorrect quantity length")
    public short getQuantity() {
        return quantity;
    }
    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect code format")
    @Size(min = 1, max = 16, message = "Incorrect code length")
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.FLOAT_PATTERN, message = "Incorrect price format")
    @Size(min = 1, max = 9, message = "Incorrect quantity length")
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    @Pattern(regexp = ProductServiceImpl.FLOAT_PATTERN, message = "Incorrect price format")
    @Size(min = 1, max = 9, message = "Incorrect quantity length")
    public float getOldPrice() {
        return oldPrice;
    }
    public void setOldPrice(float oldPrice) {
        this.oldPrice = oldPrice;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect allow age format")
    @Size(min = 1, max = 2, message = "Incorrect allow age length")
    public short getAllowAge() {
        return allowAge;
    }
    public void setAllowAge(short allowAge) {
        this.allowAge = allowAge;
    }

    public boolean isActive() {
        return isActive;
    }
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Pattern(regexp = ProductServiceImpl.FLOAT_PATTERN, message = "Incorrect rating format")
    @Size(min = 1, max = 3, message = "Incorrect rating length")
    public float getRating() {
        return rating;
    }
    public void setRating(float rating) {
        this.rating = rating;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect width format")
    @Size(min = 1, max = 3, message = "Incorrect width length")
    public short getWidth() {
        return width;
    }
    public void setWidth(short width) {
        this.width = width;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect height format")
    @Size(min = 1, max = 3, message = "Incorrect height length")
    public short getHeight() {
        return height;
    }
    public void setHeight(short height) {
        this.height = height;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect length format")
    @Size(min = 1, max = 3, message = "Incorrect length length")
    public short getLength() {
        return length;
    }
    public void setLength(short length) {
        this.length = length;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect brand format")
    public int getBrand() {
        return brand;
    }
    public void setBrand(int brand) {
        this.brand = brand;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect subcategory format")
    public int getSubcategory() {
        return subcategory;
    }
    public void setSubcategory(int subcategory) {
        this.subcategory = subcategory;
    }

    @NotNull
    @Pattern(regexp = ProductServiceImpl.INT_PATTERN, message = "Incorrect images format")
    public int[] getImages() {
        return images;
    }
    public void setImages(int[] images) {
        this.images = images;
    }

    public List<ReviewDTO> getReviewsList() {
        return reviewsList;
    }
    public void setReviewsList(List<ReviewDTO> reviewsList) {
        this.reviewsList = reviewsList;
    }
}
