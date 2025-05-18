<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.possystem.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Start New Sale</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f2f2f2;
        }

        h1 {
            color: #2c3e50;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 15px;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            display: block;
            width: 100%;
            margin-top: 20px;
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .nav {
            text-align: center;
            margin-top: 20px;
        }

        .nav a {
            margin: 10px;
            text-decoration: none;
            color: #3498db;
        }
    </style>
</head>
<body>

<h1 align="center">🛒 Add Item to Cart</h1>

<form action="sales" method="post">
    <label for="productId">Select Product:</label>
    <select name="productId" required>
        <option value="" disabled selected>-- Choose a product --</option>
        <% for (Product p : products) { %>
            <option value="<%= p.getId() %>">
                <%= p.getName() %> - Rs. <%= p.getPrice() %> (Available: <%= p.getQuantity() %>)
            </option>
        <% } %>
    </select>

    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" min="1" required />

    <button type="submit" class="btn">➕ Add to Cart</button>
</form>

<div class="nav">
    <a href="sales?action=complete">✅ Complete Sale</a> |
    <a href="index.jsp">🏠 Back to Dashboard</a>
</div>

</body>
</html>
