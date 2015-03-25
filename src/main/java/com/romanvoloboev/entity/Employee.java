package com.romanvoloboev.entity;

import javax.persistence.*;

/**
 * @author Roman Voloboev
 */

@NamedQueries({
        @NamedQuery(name = Employee.SELECT_BY_LOGIN, query = "SELECT e FROM Employee e WHERE lower(e.login) LIKE :login")
})

@Entity
@Table(name = "employee")
public class Employee {
    public static final String SELECT_BY_LOGIN = "select_employee_by_login";

    private Integer id;
    private String name;
    private String login;
    private String password;
    private boolean isActive;
    private boolean isAdmin;

    public Employee() {
    }

    public Employee(Integer id, String name, String login, String password, boolean isActive, boolean isAdmin) {
        this.id = id;
        this.name = name;
        this.login = login;
        this.password = password;
        this.isActive = isActive;
        this.isAdmin = isAdmin;
    }

    public Employee(String name, String login, String password, boolean isActive, boolean isAdmin) {
        this.name = name;
        this.login = login;
        this.password = password;
        this.isActive = isActive;
        this.isAdmin = isAdmin;
    }

    @Id
    @SequenceGenerator(name = "sequence", sequenceName = "employee_seq")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "sequence")
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

    @Column(name = "is_active")
    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Column(name = "is_admin")
    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean isSuper) {
        this.isAdmin = isSuper;
    }
}
