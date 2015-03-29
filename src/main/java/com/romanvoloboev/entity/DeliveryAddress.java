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
    private User user;

    public DeliveryAddress() {
    }

    public DeliveryAddress(Integer id, String city, String street, short house, short flat, User user) {
        this.id = id;
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
        this.user = user;
    }

    public DeliveryAddress(String city, String street, short house, short flat, User user) {
        this.city = city;
        this.street = street;
        this.house = house;
        this.flat = flat;
        this.user = user;
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
    @JoinColumn(name = "user")
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
}
