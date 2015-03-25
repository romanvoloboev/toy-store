package com.romanvoloboev.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

/**
 * @author Roman Voloboev
 */

@NamedQueries({
        @NamedQuery(name = Customer.SELECT_BY_LOGIN, query = "SELECT c FROM Customer c WHERE lower(c.login) LIKE :login")
})

@Entity
@Table(name = "customer")
public class Customer {
    public static final String SELECT_BY_LOGIN = "select_customer_by_email";

    private Integer id;
    private String name;
    private String login;
    private String password;
    private String phone;
    private boolean isActive;
    private Collection<Product> wishes = new ArrayList<>();
    private Collection<Review> reviews = new ArrayList<>();
    private Collection<Booking> bookings = new ArrayList<>();
    private Collection<DeliveryAddress> addresses = new ArrayList<>();

    public Customer() {
    }

    public Customer(Integer id, String name, String login, String password, String phone, boolean isActive,
                    Collection<Product> wishes, Collection<Review> reviews, Collection<Booking> bookings,
                    Collection<DeliveryAddress> addresses) {
        this.id = id;
        this.name = name;
        this.login = login;
        this.password = password;
        this.phone = phone;
        this.isActive = isActive;
        this.wishes = wishes;
        this.reviews = reviews;
        this.bookings = bookings;
        this.addresses = addresses;
    }

    public Customer(String name, String login, String password, String phone, boolean isActive,
                    Collection<Product> wishes, Collection<Review> reviews, Collection<Booking> bookings,
                    Collection<DeliveryAddress> addresses) {
        this.name = name;
        this.login = login;
        this.password = password;
        this.phone = phone;
        this.isActive = isActive;
        this.wishes = wishes;
        this.reviews = reviews;
        this.bookings = bookings;
        this.addresses = addresses;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "customer_seq")
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

    @Column(name = "login", length = 50, nullable = false)
    public String getLogin() {
        return login;
    }
    public void setLogin(String login) {
        this.login = login;
    }

    @Column(name = "password", length = 50, nullable = false)
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "phone", length = 50)
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "is_active")
    public boolean isActive() {
        return isActive;
    }
    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public Collection<Review> getReviews() {
        return reviews;
    }
    public void setReviews(Collection<Review> reviews) {
        this.reviews = reviews;
    }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public Collection<Booking> getBookings() {
        return bookings;
    }
    public void setBookings(Collection<Booking> bookings) {
        this.bookings = bookings;
    }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public Collection<DeliveryAddress> getAddresses() {
        return addresses;
    }
    public void setAddresses(Collection<DeliveryAddress> addresses) {
        this.addresses = addresses;
    }

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "wish",
            joinColumns = @JoinColumn(name = "customer_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    public Collection<Product> getWishes() {
        return wishes;
    }
    public void setWishes(Collection<Product> wishes) {
        this.wishes = wishes;
    }
}