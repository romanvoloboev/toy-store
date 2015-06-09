package com.romanvoloboev.dto;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public class BookingDTO {
    private int id;
    private double amount;
    private String date;
    private short status;
    private short deliveryService;
    private short deliveryType;
    private short paymentType;
    private String statusName;
    private String deliveryServiceName;
    private String deliveryTypeName;
    private String paymentTypeName;
    private int customer;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private String customerAddress;
    private List<BookingItemDTO> items = new ArrayList<>();

    public BookingDTO() {
    }

    public BookingDTO(int id, double amount, String date, String statusName, String deliveryServiceName, String deliveryTypeName,
                      String paymentTypeName, String customerName, String customerEmail, String customerPhone,
                      String customerAddress, List<BookingItemDTO> items) {
        this.id = id;
        this.amount = amount;
        this.date = date;
        this.statusName = statusName;
        this.deliveryServiceName = deliveryServiceName;
        this.deliveryTypeName = deliveryTypeName;
        this.paymentTypeName = paymentTypeName;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.items = items;
    }

    public BookingDTO(double amount, short deliveryService, short deliveryType, short paymentType,
                      int customer, String customerAddress, List<BookingItemDTO> items) {
        this.amount = amount;
        this.deliveryService = deliveryService;
        this.deliveryType = deliveryType;
        this.paymentType = paymentType;
        this.customer = customer;
        this.customerAddress = customerAddress;
        this.items = items;
    }

    public BookingDTO(int id, String customerName, String statusName, double amount, String date) {
        this.id = id;
        this.customerName = customerName;
        this.statusName = statusName;
        this.amount = amount;
        this.date = date;
    }



    @NotNull
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    @NotNull
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }

    @DateTimeFormat(pattern = "MM/dd/yyyy")
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }

    @NotNull
    public short getStatus() {
        return status;
    }
    public void setStatus(short status) {
        this.status = status;
    }

    @NotNull
    public short getDeliveryService() {
        return deliveryService;
    }
    public void setDeliveryService(short deliveryService) {
        this.deliveryService = deliveryService;
    }

    @NotNull
    public short getDeliveryType() {
        return deliveryType;
    }
    public void setDeliveryType(short deliveryType) {
        this.deliveryType = deliveryType;
    }

    @NotNull
    public String getCustomerAddress() {
        return customerAddress;
    }
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    @NotNull
    public short getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(short paymentType) {
        this.paymentType = paymentType;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    @NotNull
    public int getCustomer() {
        return customer;
    }
    public void setCustomer(int customer) {
        this.customer = customer;
    }

    public String getStatusName() {
        return statusName;
    }
    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getDeliveryServiceName() {
        return deliveryServiceName;
    }
    public void setDeliveryServiceName(String deliveryServiceName) {
        this.deliveryServiceName = deliveryServiceName;
    }

    public String getDeliveryTypeName() {
        return deliveryTypeName;
    }
    public void setDeliveryTypeName(String deliveryTypeName) {
        this.deliveryTypeName = deliveryTypeName;
    }

    public String getPaymentTypeName() {
        return paymentTypeName;
    }
    public void setPaymentTypeName(String paymentTypeName) {
        this.paymentTypeName = paymentTypeName;
    }

    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public List<BookingItemDTO> getItems() {
        return items;
    }
    public void setItems(List<BookingItemDTO> items) {
        this.items = items;
    }
}
