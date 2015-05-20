package com.romanvoloboev.model;

import javax.persistence.*;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "booking_item")
public class BookingItem {
    private Integer id;
    private Short quantity;
    private Float price;
    private Booking booking;
    private Product product;

    public BookingItem() {
    }

    public BookingItem(Integer id, Short quantity, Float price, Booking booking, Product product) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.booking = booking;
        this.product = product;
    }

    public BookingItem(Short quantity, Float price, Booking booking, Product product) {
        this.quantity = quantity;
        this.price = price;
        this.booking = booking;
        this.product = product;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "booking_item_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "quantity", nullable = false)
    public Short getQuantity() {
        return quantity;
    }
    public void setQuantity(Short quantity) {
        this.quantity = quantity;
    }

    @Column(name = "price", nullable = false)
    public Float getPrice() {
        return price;
    }
    public void setPrice(Float price) {
        this.price = price;
    }

    @ManyToOne
    @JoinColumn(name = "booking")
    public Booking getBooking() {
        return booking;
    }
    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    @OneToOne
    @JoinColumn(name = "product")
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
}
