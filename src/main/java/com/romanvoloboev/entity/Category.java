package com.romanvoloboev.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "category")
public class Category {
    private Integer id;
    private String name;
    private boolean isActive;
    private Collection<Subcategory> subcategories = new ArrayList<>();

    public Category() {
    }

    public Category(Integer id, String name, boolean isActive, Collection<Subcategory> subcategories) {
        this.id = id;
        this.name = name;
        this.isActive = isActive;
        this.subcategories = subcategories;
    }

    public Category(String name, boolean isActive, Collection<Subcategory> subcategories) {
        this.name = name;
        this.isActive = isActive;
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
        return isActive;
    }
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public Collection<Subcategory> getSubcategories() {
        return subcategories;
    }
    public void setSubcategories(Collection<Subcategory> subcategories) {
        this.subcategories = subcategories;
    }
}
