<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.possystem.model.Product" %>
<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f9f9f9;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        a.button {
            padding: 8px 12px;
            margin-right: 8px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        a.button:hover {
            background-color: #27ae60;
        }

        .actions a {
            background-color: #f39c12;
            color: white;
        }

        .actions a.delete {
            background-color: #e74c3c;
        }

        .top-bar {
            margin-bottom: 20px;
        }

        .top-bar a {
            padding: 10px 16px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .top-bar a:hover {
            background-color: #1c6ea4;
        }
    </style>
</head>
<body>

<div class="top-bar">
    <a href="products?action=new">➕ Add New Product</a>
    <a href="index.jsp" style="margin-left: 10px;">🏠 Back to Dashboard</a>
</div>

<h1>Product List</h1>

<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Product Name</th>
            <th>Price (Rs)</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <% if (productList != null && !productList.isEmpty()) {
        for (Product p : productList) { %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td><%= p.getPrice() %></td>
                <td><%= p.getQuantity() %></td>
                <td class="actions">
                    <a href="products?action=edit&id=<%= p.getId() %>" class="button">✏️ Edit</a>
                    <a href="products?action=delete&id=<%= p.getId() %>" class="button delete"
                       onclick="return confirm('Are you sure you want to delete this product?');">🗑️ Delete</a>
                </td>
            </tr>
    <%  }
    } else { %>
        <tr>
            <td colspan="5" style="text-align:center;">No products found.</td>
        </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
