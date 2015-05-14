package com.romanvoloboev.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "subcategory")
public class Subcategory {
    private Integer id;
    private String name;
    private boolean active;
    private Category category;
    private Image image;
    private List<Product> products = new ArrayList<>();

    public Subcategory() {
    }

    public Subcategory(Integer id, String name, boolean isActive, Category category, Image image, List<Product> products) {
        this.id = id;
        this.name = name;
        this.active = isActive;
        this.category = category;
        this.image = image;
        this.products = products;
    }

    public Subcategory(String name, boolean isActive, Category category, Image image) {
        this.name = name;
        this.active = isActive;
        this.category = category;
        this.image = image;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "subcategory_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "name", nullable = false, length = 50)
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

    @ManyToOne
    @JoinColumn(name = "category")
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "image")
    public Image getImage() {
        return image;
    }
    public void setImage(Image image) {
        this.image = image;
    }

    @OneToMany(mappedBy = "subcategory", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    public List<Product> getProducts() {
        return products;
    }
    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
