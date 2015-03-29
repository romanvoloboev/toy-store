package com.romanvoloboev.entity;

/**
 * @author Roman Voloboev
 * User roles enum
 * CUSTOMER - it's a visitor of store which can use all functions such as buy products, leave reviews, edit personal information, etc.
 * EMPLOYEE - it's a customer which has access to store's control panel, can manage orders, products, cutomers (except that has EMPLOYEE and ADMIN role).
 * ADMIN - it's same as CUSTOMER and EMPLOYEE, can manage all users, but can't be managed by EMPLOYEE.
 */

public enum Role {
    CUSTOMER, EMPLOYEE, ADMIN
}
