package com.mycompany.possystem.servlet;

import com.mycompany.possystem.dao.ProductDAO;
import com.mycompany.possystem.dao.SalesDAO;
import com.mycompany.possystem.model.Product;
import com.mycompany.possystem.model.Sale;
import com.mycompany.possystem.model.SaleItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/sales")
public class SalesServlet extends HttpServlet {
    private SalesDAO salesDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        salesDAO = new SalesDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("new")) {
            // Start new sale page
            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("products", productList);
            request.getRequestDispatcher("add_sale.jsp").forward(request, response);

        } else if (action.equals("cart")) {
            // View cart
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } else if (action.equals("complete")) {
            // Complete sale
            HttpSession session = request.getSession();
            List<SaleItem> cart = (List<SaleItem>) session.getAttribute("cart");

            if (cart == null || cart.isEmpty()) {
                response.sendRedirect("sales?action=new");
                return;
            }

            double totalAmount = cart.stream().mapToDouble(SaleItem::getSubtotal).sum();

            Sale sale = new Sale();
            sale.setTotalAmount(totalAmount);

            int saleId = salesDAO.createSale(sale);
            salesDAO.addSaleItems(saleId, cart);

            session.removeAttribute("cart"); // clear cart
            request.setAttribute("saleId", saleId);
            request.setAttribute("totalAmount", totalAmount);
            request.getRequestDispatcher("receipt.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = productDAO.getProductById(productId);
        double subtotal = product.getPrice() * quantity;

        SaleItem item = new SaleItem();
        item.setProductId(productId);
        item.setQuantity(quantity);
        item.setSubtotal(subtotal);

        HttpSession session = request.getSession();
        List<SaleItem> cart = (List<SaleItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(item);
        session.setAttribute("cart", cart);

        response.sendRedirect("sales?action=new");
    }
}
