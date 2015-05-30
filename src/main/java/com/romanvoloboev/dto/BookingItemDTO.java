package com.romanvoloboev.dto;

/**
 * @author Roman Voloboev
 */

public class BookingItemDTO {
    private int id;
    private short quantity;
    private float price;
    private float totalItemPrice;
    private int product;
    private String productName;

    public BookingItemDTO() {
    }

    public BookingItemDTO(short quantity, float price, float totalItemPrice, String productName, int product) {
        this.quantity = quantity;
        this.price = price;
        this.totalItemPrice = totalItemPrice;
        this.productName = productName;
        this.product = product;
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

    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    public float getTotalItemPrice() {
        return totalItemPrice;
    }
    public void setTotalItemPrice(float totalItemPrice) {
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
}
