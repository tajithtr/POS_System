package com.mycompany.possystem.service;

import com.mycompany.possystem.dao.ProductDAO;
import com.mycompany.possystem.model.Product;

import java.util.List;

public class ProductService {
    private final ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    // Get all products
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    // Get one product
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    // Add new product with basic validation
    public boolean addProduct(Product product) {
        if (product.getName() == null || product.getName().trim().isEmpty() ||
            product.getPrice() <= 0 || product.getQuantity() < 0) {
            return false; // validation failed
        }
        return productDAO.addProduct(product);
    }

    // Update product
    public boolean updateProduct(Product product) {
        if (product.getId() <= 0 ||
            product.getName() == null || product.getName().trim().isEmpty() ||
            product.getPrice() <= 0 || product.getQuantity() < 0) {
            return false; // validation failed
        }
        return productDAO.updateProduct(product);
    }

    // Delete product
    public boolean deleteProduct(int id) {
        return productDAO.deleteProduct(id);
    }
}
