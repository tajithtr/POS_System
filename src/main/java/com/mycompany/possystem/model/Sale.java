package com.mycompany.possystem.model;

import java.sql.Timestamp;

public class Sale {
    private int id;
    private Timestamp saleDate;
    private double totalAmount;

    // Constructors
    public Sale() {}

    public Sale(int id, Timestamp saleDate, double totalAmount) {
        this.id = id;
        this.saleDate = saleDate;
        this.totalAmount = totalAmount;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Timestamp saleDate) {
        this.saleDate = saleDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}