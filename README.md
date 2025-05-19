# 🛒 Retail POS System
<img src="assets/POS%20Banner.png" width="700" />

A modern, full-featured Point of Sale system for retail businesses. Handles inventory, sales, receipts, and reporting with a clean interface and efficient performance.

---

## ✨ Features

- ⚡ **Fast Checkout** with printable receipts  
- 📦 **Real-time Inventory Management**  
- 📊 **Sales Analytics Dashboard**  
- 👥 **Multi-user Access Control**

---

## 🛠️ Tech Stack

- **Frontend**: JSP, Bootstrap  
- **Backend**: Java Servlets  
- **Database**: MySQL  
- **Build Tool**: Maven

---

## 🗃️ Database Setup

Run the following SQL in MySQL Workbench or CLI:

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS pos_system;
USE pos_system;

-- Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL
);

-- Sales Table
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2)
);

-- Sale Items Table
CREATE TABLE sale_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES sales(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

