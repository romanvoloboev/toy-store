package com.romanvoloboev.dto;

import com.romanvoloboev.service.CategoryServiceImpl;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public class CategoryDTO {
    private int id;
    private String name;
    private boolean isActive;
    private List<SubcategoryDTO> subcategories = new ArrayList<>();

    public CategoryDTO(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public CategoryDTO(int id, String name, boolean isActive, List<SubcategoryDTO> subcategories) {
        this.id = id;
        this.name = name;
        this.isActive = isActive;
        this.subcategories = subcategories;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    @Size(min = 3, max = 50, message = "Incorrect name length")
    @Pattern(regexp = CategoryServiceImpl.NAME_PATTERN, message = "Incorrect name format")
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

    public List<SubcategoryDTO> getSubcategories() {
        return subcategories;
    }
    public void setSubcategories(List<SubcategoryDTO> subcategories) {
        this.subcategories = subcategories;
    }
}
