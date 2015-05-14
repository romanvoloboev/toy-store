package com.romanvoloboev.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "brand")
public class Brand {
    private Integer id;
    private String name;
    private String country;
    private boolean active;
    private List<Product> products = new ArrayList<>();

    public Brand() {
    }

    public Brand(Integer id, String name, String country, boolean active, List<Product> products) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.active = active;
        this.products = products;
    }

    public Brand(String name, String country, boolean active, List<Product> products) {
        this.name = name;
        this.country = country;
        this.active = active;
        this.products = products;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "brand_sequence")
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

    @Column(name = "country", length = 50, nullable = false)
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }

    @Column(name = "is_active")
    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<Product> getProducts() {
        return products;
    }
    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
