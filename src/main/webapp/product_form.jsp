<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.possystem.model.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
    boolean editing = (product != null);
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= editing ? "Edit Product" : "Add New Product" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f4f4f4;
        }

        .form-container {
            max-width: 500px;
            background: white;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
        }

        label {
            margin-top: 10px;
            display: block;
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            margin-top: 20px;
            padding: 12px;
            width: 100%;
            background-color: #3498db;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back a {
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2><%= editing ? "Edit Product" : "Add New Product" %></h2>

    <form method="post" action="products">
        <% if (editing) { %>
            <input type="hidden" name="id" value="<%= product.getId() %>">
        <% } %>

        <label for="name">Product Name</label>
        <input type="text" name="name" value="<%= editing ? product.getName() : "" %>" required>

        <label for="price">Price (Rs)</label>
        <input type="number" name="price" step="0.01" value="<%= editing ? product.getPrice() : "" %>" required>

        <label for="quantity">Quantity</label>
        <input type="number" name="quantity" value="<%= editing ? product.getQuantity() : "" %>" required>

        <button type="submit"><%= editing ? "Update Product" : "Add Product" %></button>
    </form>

    <div class="back">
        <a href="products">← Back to Product List</a>
    </div>
</div>

</body>
</html>
