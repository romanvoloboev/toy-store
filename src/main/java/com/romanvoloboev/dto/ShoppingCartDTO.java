package com.romanvoloboev.dto;


import java.io.Serializable;


/**
 * @author Roman Voloboev
 */

public class ShoppingCartDTO implements Serializable {
    private int id;
    private short quantity;

    public ShoppingCartDTO() {
    }

    public ShoppingCartDTO(short quantity, int id) {
        this.quantity = quantity;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }
}
