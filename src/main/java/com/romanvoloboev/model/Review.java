package com.romanvoloboev.model;

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
    private Float rating;
    private Date date;
    private boolean active;
    private Product product;
    private Customer customer;

    public Review() {
    }

    public Review(Integer id, String comment, Float rating, Date date, boolean active, Product product, Customer customer) {
        this.id = id;
        this.comment = comment;
        this.rating = rating;
        this.date = date;
        this.active = active;
        this.product = product;
        this.customer = customer;
    }

    public Review(String comment, Float rating, Date date, boolean active, Product product, Customer customer) {
        this.comment = comment;
        this.rating = rating;
        this.date = date;
        this.active = active;
        this.product = product;
        this.customer = customer;
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
    public Float getRating() {
        return rating;
    }
    public void setRating(Float rating) {
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
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
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
    @JoinColumn(name = "customer")
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
