package com.romanvoloboev.dto;

import com.romanvoloboev.service.SubcategoryServiceImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * @author Roman Voloboev
 */
public class SubcategoryDTO {
    private int id;
    private String name;
    private boolean isActive;
    private int category;
    private String categoryName;
    private long image;
    private int[] products;

    public SubcategoryDTO(int id, String name, boolean isActive, int category) {
        this.id = id;
        this.name = name;
        this.isActive = isActive;
        this.category = category;
    }

    public SubcategoryDTO(int id, String name, int category, long image) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.image = image;
    }

    public SubcategoryDTO(int id, String name, long image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    public SubcategoryDTO(int id, String name, String categoryName, int category) {
        this.id = id;
        this.name = name;
        this.categoryName = categoryName;
        this.category = category;
    }

    @NotNull
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Size(min = 3, max = 50, message = "Incorrect subcategory name length")
    @Pattern(regexp = SubcategoryServiceImpl.NAME_PATTERN, message = "Incorrect subcategory name format")
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return isActive;
    }
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    @NotNull
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

    @NotNull
    public long getImage() {
        return image;
    }
    public void setImage(long image) {
        this.image = image;
    }

    public int[] getProducts() {
        return products;
    }
    public void setProducts(int[] products) {
        this.products = products;
    }
}
