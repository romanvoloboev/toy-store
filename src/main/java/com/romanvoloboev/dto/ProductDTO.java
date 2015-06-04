package com.romanvoloboev.dto;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
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
    private double price;
    private boolean active;
    private boolean promotion;
    private double promotionPrice;
    private String promotionStart;
    private String promotionEnd;
    private double rating;
    private long reviewsCount;
    private String material;
    private String width;
    private String height;
    private String length;
    private int brand;
    private String brandName;
    private String brandCountry;
    private int category;
    private int subcategory;
    private String categoryName;
    private String subcategoryName;
    private long[] images;
    private List<ReviewDTO> reviewsList = new ArrayList<>();

    // default constructor needs for decode the JSON @RequestBody
    public ProductDTO() {
    }

    public ProductDTO(int id, String name, String description, short quantity, String code, double price,
                      boolean promotion, double promotionPrice, String promotionStart, String promotionEnd, double rating,
                      long reviewsCount, String material, String width, String height, String length, int brand, String brandName,
                      String brandCountry, int category, int subcategory, String categoryName, String subcategoryName, long[] images, List<ReviewDTO> reviewsList) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.promotion = promotion;
        this.promotionPrice = promotionPrice;
        this.promotionStart = promotionStart;
        this.promotionEnd = promotionEnd;
        this.rating = rating;
        this.reviewsCount = reviewsCount;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.brand = brand;
        this.brandName = brandName;
        this.brandCountry = brandCountry;
        this.category = category;
        this.subcategory = subcategory;
        this.categoryName = categoryName;
        this.subcategoryName = subcategoryName;
        this.images = images;
        this.reviewsList = reviewsList;
    }

    public ProductDTO(int id, String name, double price, double promotionPrice, short quantity, long[] images, boolean active, boolean promotion) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.promotionPrice = promotionPrice;
        this.quantity = quantity;
        this.images = images;
        this.active = active;
        this.promotion = promotion;
    }

    public ProductDTO(int id, String name, String description, double price, boolean promotion, double promotionPrice, double rating, long[] images) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.promotion = promotion;
        this.promotionPrice = promotionPrice;
        this.rating = rating;
        this.images = images;
    }

    public ProductDTO(int id, String name, double price, boolean promotion, double promotionPrice, double rating, long[] images) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.promotion = promotion;
        this.promotionPrice = promotionPrice;
        this.rating = rating;
        this.images = images;
    }

    @NotNull
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Size(min = 3, max = 80, message = "Incorrect name length")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @NotNull
    @Size(min = 3, max = 5000, message = "Incorrect description length")
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @DateTimeFormat(pattern = "MM/dd/yyyy")
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    @NotNull
    public short getQuantity() {
        return quantity;
    }
    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    @NotNull
    @Size(min = 1, max = 16, message = "Incorrect code length")
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    @NotNull
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isPromotion() {
        return promotion;
    }
    public void setPromotion(boolean promotion) {
        this.promotion = promotion;
    }

    public double getPromotionPrice() {
        return promotionPrice;
    }
    public void setPromotionPrice(double promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    @DateTimeFormat(pattern = "MM/dd/yyyy")
    public String getPromotionStart() {
        return promotionStart;
    }
    public void setPromotionStart(String promotionStart) {
        this.promotionStart = promotionStart;
    }

    @DateTimeFormat(pattern = "MM/dd/yyyy")
    public String getPromotionEnd() {
        return promotionEnd;
    }
    public void setPromotionEnd(String promotionEnd) {
        this.promotionEnd = promotionEnd;
    }

    public double getRating() {
        return rating;
    }
    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getWidth() {
        return width;
    }
    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }
    public void setHeight(String height) {
        this.height = height;
    }

    public String getLength() {
        return length;
    }
    public void setLength(String length) {
        this.length = length;
    }

    @NotNull
    public int getBrand() {
        return brand;
    }
    public void setBrand(int brand) {
        this.brand = brand;
    }

    public String getBrandName() {
        return brandName;
    }
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    @NotNull
    public int getSubcategory() {
        return subcategory;
    }
    public void setSubcategory(int subcategory) {
        this.subcategory = subcategory;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }
    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    public String getMaterial() {
        return material;
    }
    public void setMaterial(String material) {
        this.material = material;
    }

    @NotNull
    @Size(min = 1, max = 5, message = "Wrong images count")
    public long[] getImages() {
        return images;
    }
    public void setImages(long[] images) {
        this.images = images;
    }

    public long getReviewsCount() {
        return reviewsCount;
    }
    public void setReviewsCount(long reviewsCount) {
        this.reviewsCount = reviewsCount;
    }

    public String getBrandCountry() {
        return brandCountry;
    }
    public void setBrandCountry(String brandCountry) {
        this.brandCountry = brandCountry;
    }

    public int getCategory() {
        return category;
    }
    public void setCategory(int category) {
        this.category = category;
    }

    public String getCategoryName() {
        return categoryName;
    }
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<ReviewDTO> getReviewsList() {
        return reviewsList;
    }
    public void setReviewsList(List<ReviewDTO> reviewsList) {
        this.reviewsList = reviewsList;
    }
}
