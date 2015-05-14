package com.romanvoloboev.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "product")
public class Product {
    private Integer id;
    private String name;
    private String description;
    private Date date;
    private short quantity;
    private String code;
    private float price;
    private float oldPrice;
    private short allowAge;
    private boolean active;
    private float rating;
    private short width;
    private short height;
    private short length;
    private Brand brand;
    private Subcategory subcategory;
    private List<Image> images = new ArrayList<>();
    private List<Review> reviews = new ArrayList<>();

    public Product() {
    }

    public Product(Integer id, String name, String description, Date date, short quantity, String code, float price,
                   float oldPrice, short allowAge, boolean active, float rating, short width,
                   short height, short length, Brand brand, Subcategory subcategory, List<Image> images,
                   List<Review> reviews) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.oldPrice = oldPrice;
        this.allowAge = allowAge;
        this.active = active;
        this.rating = rating;
        this.width = width;
        this.height = height;
        this.length = length;
        this.brand = brand;
        this.subcategory = subcategory;
        this.images = images;
        this.reviews = reviews;
    }

    public Product(String name, String description, Date date, short quantity, String code, float price, float oldPrice,
                   short allowAge, boolean active, float rating, short width, short height,
                   short length, Brand brand, Subcategory subcategory, List<Image> images,
                   List<Review> reviews) {
        this.name = name;
        this.description = description;
        this.date = date;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.oldPrice = oldPrice;
        this.allowAge = allowAge;
        this.active = active;
        this.rating = rating;
        this.width = width;
        this.height = height;
        this.length = length;
        this.brand = brand;
        this.subcategory = subcategory;
        this.images = images;
        this.reviews = reviews;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "product_seq")
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

    @Column(name = "description", length = 2000, nullable = false)
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "date", nullable = false)
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "quantity", nullable = false)
    public short getQuantity() {
        return quantity;
    }
    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    @Column(name = "code", length = 16, nullable = false)
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    @Column(name = "price", nullable = false)
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    @Column(name = "old_price")
    public float getOldPrice() {
        return oldPrice;
    }
    public void setOldPrice(float oldPrice) {
        this.oldPrice = oldPrice;
    }

    @Column(name = "allow_age")
    public short getAllowAge() {
        return allowAge;
    }
    public void setAllowAge(short allowAge) {
        this.allowAge = allowAge;
    }

    @Column(name = "is_active", nullable = false)
    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    @Column(name = "rating", nullable = false)
    public float getRating() {
        return rating;
    }
    public void setRating(float rating) {
        this.rating = rating;
    }

    @Column(name = "width")
    public short getWidth() {
        return width;
    }
    public void setWidth(short width) {
        this.width = width;
    }

    @Column(name = "height")
    public short getHeight() {
        return height;
    }
    public void setHeight(short height) {
        this.height = height;
    }

    @Column(name = "length")
    public short getLength() {
        return length;
    }
    public void setLength(short length) {
        this.length = length;
    }

    @ManyToOne
    @JoinColumn(name = "brand")
    public Brand getBrand() {
        return brand;
    }
    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    @ManyToOne
    @JoinColumn(name = "subcategory")
    public Subcategory getSubcategory() {
        return subcategory;
    }
    public void setSubcategory(Subcategory subcategory) {
        this.subcategory = subcategory;
    }

    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "product_image",
            joinColumns = @JoinColumn(name = "product_id"),
            inverseJoinColumns = @JoinColumn(name = "image_id"))
    public List<Image> getImages() {
        return images;
    }
    public void setImages(List<Image> images) {
        this.images = images;
    }

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<Review> getReviews() {
        return reviews;
    }
    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
}
