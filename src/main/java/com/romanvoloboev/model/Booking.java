package com.romanvoloboev.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "booking")
public class Booking {
    private Integer id;
    private float amount;
    private Date date;
    private short status;
    private short deliveryService;
    private short paymentType;
    private Customer customer;
    private List<BookingItem> items = new ArrayList<>();

    public Booking() {
    }

    public Booking(Integer id, float amount, Date date, short status, short deliveryService, short paymentType, Customer customer,
                   List<BookingItem> items) {
        this.id = id;
        this.amount = amount;
        this.date = date;
        this.status = status;
        this.deliveryService = deliveryService;
        this.paymentType = paymentType;
        this.customer = customer;
        this.items = items;
    }

    public Booking(float amount, Date date, short status, short deliveryService, short paymentType, Customer customer,
                   List<BookingItem> items) {
        this.amount = amount;
        this.date = date;
        this.status = status;
        this.deliveryService = deliveryService;
        this.paymentType = paymentType;
        this.customer = customer;
        this.items = items;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "booking_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "amount", nullable = false)
    public float getAmount() {
        return amount;
    }
    public void setAmount(float amount) {
        this.amount = amount;
    }

    @Column(name = "date", nullable = false)
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "status", nullable = false)
    public short getStatus() {
        return status;
    }
    public void setStatus(short status) {
        this.status = status;
    }

    @Column(name = "delivery_service", nullable = false)
    public short getDeliveryService() {
        return deliveryService;
    }
    public void setDeliveryService(short deliveryService) {
        this.deliveryService = deliveryService;
    }

    @Column(name = "payment_type", nullable = false)
    public short getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(short paymentType) {
        this.paymentType = paymentType;
    }

    @ManyToOne
    @JoinColumn(name = "customer")
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<BookingItem> getItems() {
        return items;
    }
    public void setItems(List<BookingItem> items) {
        this.items = items;
    }
}
