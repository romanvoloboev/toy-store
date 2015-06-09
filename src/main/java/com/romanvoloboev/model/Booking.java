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
    private double amount;
    private Date date;
    private Short status;
    private Short deliveryType;
    private Short deliveryService;
    private Short paymentType;
    private String customerAddress;
    private String customerPhone;
    private String customerName;
    private Customer customer;
    private List<BookingItem> items = new ArrayList<>();

    public Booking() {
    }

    public Booking(double amount, Date date, Short status, Short deliveryType, Short deliveryService,
                   Short paymentType, Customer customer, String customerAddress, String customerPhone, String customerName,
                   List<BookingItem> items) {
        this.amount = amount;
        this.date = date;
        this.status = status;
        this.deliveryType = deliveryType;
        this.deliveryService = deliveryService;
        this.paymentType = paymentType;
        this.customer = customer;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.customerName = customerName;
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
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
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
    public Short getStatus() {
        return status;
    }
    public void setStatus(Short status) {
        this.status = status;
    }

    @Column(name = "delivery_type", nullable = false)
    public Short getDeliveryType() {
        return deliveryType;
    }
    public void setDeliveryType(Short deliveryType) {
        this.deliveryType = deliveryType;
    }

    @Column(name = "delivery_service", nullable = false)
    public Short getDeliveryService() {
        return deliveryService;
    }
    public void setDeliveryService(Short deliveryService) {
        this.deliveryService = deliveryService;
    }

    @Column(name = "payment_type", nullable = false)
    public Short getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(Short paymentType) {
        this.paymentType = paymentType;
    }

    @Column(name = "customer_address", nullable = false)
    public String getCustomerAddress() {
        return customerAddress;
    }
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    @Column(name = "customer_phone", nullable = false)
    public String getCustomerPhone() {
        return customerPhone;
    }
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    @Column(name = "customer_name", nullable = false)
    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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
