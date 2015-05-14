package com.romanvoloboev.model;

import com.romanvoloboev.model.enums.Role;
import org.hibernate.validator.constraints.Email;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

@Entity
@Table(name = "customer")
public class Customer {
    private Integer id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private boolean active;
    private Role role;
    private List<Product> wishes = new ArrayList<>();
    private List<Review> reviews = new ArrayList<>();
    private List<Booking> bookings = new ArrayList<>();
    private List<Address> addresses = new ArrayList<>();

    public Customer() {
    }

    public Customer(Integer id, String name, String email, String password, String phone, boolean active, Role role,
                    List<Product> wishes, List<Review> reviews, List<Booking> bookings,
                    List<Address> addresses) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.active = active;
        this.role = role;
        this.wishes = wishes;
        this.reviews = reviews;
        this.bookings = bookings;
        this.addresses = addresses;
    }

    public Customer(String name, String email, String password, String phone, boolean active, Role role,
                    List<Product> wishes, List<Review> reviews, List<Booking> bookings,
                    List<Address> addresses) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.active = active;
        this.role = role;
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

    @Email
    @Column(name = "email", length = 50, nullable = false, unique = true)
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
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
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    @Column(name = "role", nullable = false)
    @Enumerated(EnumType.STRING)
    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<Review> getReviews() {
        return reviews;
    }
    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<Booking> getBookings() {
        return bookings;
    }
    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    public List<Address> getAddresses() {
        return addresses;
    }
    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "wish",
            joinColumns = @JoinColumn(name = "customer_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    public List<Product> getWishes() {
        return wishes;
    }
    public void setWishes(List<Product> wishes) {
        this.wishes = wishes;
    }
}