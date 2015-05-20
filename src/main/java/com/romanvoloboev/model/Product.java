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
    private Short quantity;
    private String code;
    private Double price;
    private boolean active;
    private Double promotionPrice;
    private Date promotionStart;
    private Date promotionEnd;
    private boolean promotion;
    private Double rating;
    private String material;
    private String width;
    private String height;
    private String length;
    private Brand brand;
    private Subcategory subcategory;
    private List<Image> images = new ArrayList<>();
    private List<Review> reviews = new ArrayList<>();

    public Product() {
    }

    public Product(Integer id, String name, String description, Date date, Short quantity, String code, Double price,
                   boolean active, Double promotionPrice, Date promotionStart, Date promotionEnd, boolean promotion,
                   Double rating, String material, String width, String height, String length, Brand brand, Subcategory
                           subcategory, List<Image> images, List<Review> reviews) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.active = active;
        this.promotionPrice = promotionPrice;
        this.promotionStart = promotionStart;
        this.promotionEnd = promotionEnd;
        this.promotion = promotion;
        this.rating = rating;
        this.material = material;
        this.width = width;
        this.height = height;
        this.length = length;
        this.brand = brand;
        this.subcategory = subcategory;
        this.images = images;
        this.reviews = reviews;
    }

    public Product(String name, String description, Date date, Short quantity, String code, Double price, boolean active,
                   Double promotionPrice, Date promotionStart, Date promotionEnd, boolean promotion, Double rating,
                   String material, String width, String height, String length, Brand brand, Subcategory subcategory,
                   List<Image> images, List<Review> reviews) {
        this.name = name;
        this.description = description;
        this.date = date;
        this.quantity = quantity;
        this.code = code;
        this.price = price;
        this.active = active;
        this.promotionPrice = promotionPrice;
        this.promotionStart = promotionStart;
        this.promotionEnd = promotionEnd;
        this.promotion = promotion;
        this.rating = rating;
        this.material = material;
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
    public Short getQuantity() {
        return quantity;
    }
    public void setQuantity(Short quantity) {
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
    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }

    @Column(name = "promo_price")
    public Double getPromotionPrice() {
        return promotionPrice;
    }
    public void setPromotionPrice(Double promotionPrice) {
        this.promotionPrice = promotionPrice;
    }

    @Column(name = "is_active")
    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    @Column(name = "promotion_start")
    public Date getPromotionStart() {
        return promotionStart;
    }
    public void setPromotionStart(Date promotionStart) {
        this.promotionStart = promotionStart;
    }

    @Column(name = "promotion_end")
    public Date getPromotionEnd() {
        return promotionEnd;
    }
    public void setPromotionEnd(Date promotionEnd) {
        this.promotionEnd = promotionEnd;
    }

    @Column(name = "has_promo")
    public boolean isPromotion() {
        return promotion;
    }
    public void setPromotion(boolean promotion) {
        this.promotion = promotion;
    }

    @Column(name = "rating", nullable = false)
    public Double getRating() {
        return rating;
    }
    public void setRating(Double rating) {
        this.rating = rating;
    }

    @Column(name = "width")
    public String getWidth() {
        return width;
    }
    public void setWidth(String width) {
        this.width = width;
    }

    @Column(name = "height")
    public String getHeight() {
        return height;
    }
    public void setHeight(String height) {
        this.height = height;
    }

    @Column(name = "length")
    public String getLength() {
        return length;
    }
    public void setLength(String length) {
        this.length = length;
    }

    @Column(name = "material")
    public String getMaterial() {
        return material;
    }
    public void setMaterial(String material) {
        this.material = material;
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

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    public List<Review> getReviews() {
        return reviews;
    }
    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
}
