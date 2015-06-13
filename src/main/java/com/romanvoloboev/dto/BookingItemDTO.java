package com.romanvoloboev.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author Roman Voloboev
 */

public class BookingItemDTO {
    private int id;
    private short quantity;
    private double price;
    private double totalItemPrice;
    private int product;
    private long productImage;
    private String productName;

    public BookingItemDTO() {
    }

    public BookingItemDTO(short quantity, double price, double totalItemPrice, String productName, int product) {
        this.quantity = quantity;
        this.price = price;
        this.totalItemPrice = totalItemPrice;
        this.productName = productName;
        this.product = product;
    }

    public BookingItemDTO(short quantity, double price, double totalItemPrice, String productName, int product, long productImage) {
        this.quantity = quantity;
        this.price = price;
        this.totalItemPrice = totalItemPrice;
        this.product = product;
        this.productImage = productImage;
        this.productName = productName;
    }

    public BookingItemDTO(int id, short quantity, double price, double totalItemPrice, String productName, int product, long productImage) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.totalItemPrice = totalItemPrice;
        this.product = product;
        this.productImage = productImage;
        this.productName = productName;
    }

    @JsonIgnore
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

    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalItemPrice() {
        return totalItemPrice;
    }
    public void setTotalItemPrice(double totalItemPrice) {
        this.totalItemPrice = totalItemPrice;
    }

    public int getProduct() {
        return product;
    }
    public void setProduct(int product) {
        this.product = product;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public long getProductImage() {
        return productImage;
    }

    public void setProductImage(long productImage) {
        this.productImage = productImage;
    }
}
