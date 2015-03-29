package com.romanvoloboev.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "review")
public class Review {
    private Integer id;
    private String comment;
    private float rating;
    private Date date;
    private boolean isActive;
    private Product product;
    private User user;

    public Review() {
    }

    public Review(Integer id, String comment, float rating, Date date, boolean isActive, Product product, User user) {
        this.id = id;
        this.comment = comment;
        this.rating = rating;
        this.date = date;
        this.isActive = isActive;
        this.product = product;
        this.user = user;
    }

    public Review(String comment, float rating, Date date, boolean isActive, Product product, User user) {
        this.comment = comment;
        this.rating = rating;
        this.date = date;
        this.isActive = isActive;
        this.product = product;
        this.user = user;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "review_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "comment", length = 500, nullable = false)
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }

    @Column(name = "rating")
    public float getRating() {
        return rating;
    }
    public void setRating(float rating) {
        this.rating = rating;
    }

    @Column(name = "date")
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "is_active", nullable = false)
    public boolean isActive() {
        return isActive;
    }
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @ManyToOne
    @JoinColumn(name = "product")
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }

    @ManyToOne
    @JoinColumn(name = "user")
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
}
