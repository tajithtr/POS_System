package com.mycompany.possystem.service;

import com.mycompany.possystem.dao.SalesDAO;
import com.mycompany.possystem.model.Sale;
import com.mycompany.possystem.model.SaleItem;

import java.sql.Timestamp;
import java.util.List;

public class SalesService {
    private final SalesDAO salesDAO;

    public SalesService() {
        this.salesDAO = new SalesDAO();
    }

    // Create a new sale and insert its items
    public int processSale(Sale sale, List<SaleItem> items) {
        if (sale == null || items == null || items.isEmpty()) {
            return -1; // validation fail
        }

        int saleId = salesDAO.createSale(sale);
        if (saleId > 0) {
            salesDAO.addSaleItems(saleId, items);
        }
        return saleId;
    }

    // Get sales between a date range
    public List<Sale> getSalesBetween(Timestamp start, Timestamp end) {
        return salesDAO.getSalesBetween(start, end);
    }

    // Get all sales (optional)
    public List<Sale> getAllSales() {
        return salesDAO.getAllSales();
    }

    // Get items from a specific sale
    public List<SaleItem> getSaleItemsBySaleId(int saleId) {
        return salesDAO.getSaleItemsBySaleId(saleId);
    }
}
