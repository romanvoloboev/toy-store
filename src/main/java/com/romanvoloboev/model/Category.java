package com.romanvoloboev.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "category")
public class Category {
    private Integer id;
    private String name;
    private boolean active;
    private List<Subcategory> subcategories = new ArrayList<>();

    public Category() {
    }

    public Category(Integer id, String name, boolean active, List<Subcategory> subcategories) {
        this.id = id;
        this.name = name;
        this.active = active;
        this.subcategories = subcategories;
    }

    public Category(String name, boolean active, List<Subcategory> subcategories) {
        this.name = name;
        this.active = active;
        this.subcategories = subcategories;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "category_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "name", length = 50, nullable = false)
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "is_active")
    public boolean isActive() {
        return active;
    }
    public void setActive(boolean isActive) {
        this.active = isActive;
    }

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<Subcategory> getSubcategories() {
        return subcategories;
    }
    public void setSubcategories(List<Subcategory> subcategories) {
        this.subcategories = subcategories;
    }
}
