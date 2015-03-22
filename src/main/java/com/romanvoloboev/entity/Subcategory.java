package com.romanvoloboev.entity;

import javax.persistence.*;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "subcategory")
public class Subcategory {
    private Integer id;
    private String name;
    private boolean isActive;
    private Category category;
    private Image image;

    public Subcategory() {
    }

    public Subcategory(Integer id, String name, boolean isActive, Category category, Image image) {
        this.id = id;
        this.name = name;
        this.isActive = isActive;
        this.category = category;
        this.image = image;
    }

    public Subcategory(String name, boolean isActive, Category category, Image image) {
        this.name = name;
        this.isActive = isActive;
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
        return isActive;
    }
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @ManyToOne
    @JoinColumn(name = "category")
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image")
    public Image getImage() {
        return image;
    }
    public void setImage(Image image) {
        this.image = image;
    }
}
