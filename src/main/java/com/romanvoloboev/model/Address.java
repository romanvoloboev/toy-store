package com.romanvoloboev.model;

import javax.persistence.*;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "address")
public class Address {
    private Integer id;
    private String city;
    private String street;
    private String house;
    private String flat;
    private Customer customer;

    public Address() {
    }

    public Address(Integer id, String city, String street, String house, String flat, Customer customer) {
        this.id = id;
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
        this.customer = customer;
    }

    public Address(String city, String street, String house, String flat, Customer customer) {
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
        this.customer = customer;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "address_seq")
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
    public String getHouse() {
        return house;
    }
    public void setHouse(String house) {
        this.house = house;
    }

    @Column(name = "flat")
    public String getFlat() {
        return flat;
    }
    public void setFlat(String flat) {
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
