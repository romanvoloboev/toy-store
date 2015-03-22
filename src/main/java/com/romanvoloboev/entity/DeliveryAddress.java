package com.romanvoloboev.entity;

import javax.persistence.*;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "delivery_address")
public class DeliveryAddress {
    private Integer id;
    private String city;
    private String street;
    private short house;
    private short flat;
    private Customer customer;

    public DeliveryAddress() {
    }

    public DeliveryAddress(Integer id, String city, String street, short house, short flat, Customer customer) {
        this.id = id;
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
        this.customer = customer;
    }

    public DeliveryAddress(String city, String street, short house, short flat, Customer customer) {
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
        this.customer = customer;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "delivery_address_seq")
    @GeneratedValue(generator = "sequence", strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "city", length = 50, nullable = false)
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "street", length = 50, nullable = false)
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }

    @Column(name = "house", nullable = false)
    public short getHouse() {
        return house;
    }
    public void setHouse(short house) {
        this.house = house;
    }

    @Column(name = "flat")
    public short getFlat() {
        return flat;
    }
    public void setFlat(short flat) {
        this.flat = flat;
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
