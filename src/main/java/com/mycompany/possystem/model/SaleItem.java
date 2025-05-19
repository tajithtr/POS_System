package com.mycompany.possystem.model;

public class SaleItem {
    private int id;
    private int saleId;
    private int productId;
    private int quantity;
    private double subtotal;

    // Constructors
    public SaleItem() {}

    public SaleItem(int id, int saleId, int productId, int quantity, double subtotal) {
        this.id = id;
        this.saleId = saleId;
        this.productId = productId;
        this.quantity = quantity;
        this.subtotal = subtotal;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}