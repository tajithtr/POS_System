<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.possystem.model.SaleItem" %>
<%
    double totalAmount = (Double) request.getAttribute("totalAmount");
    int saleId = (Integer) request.getAttribute("saleId");
    List<SaleItem> cart = (List<SaleItem>) session.getAttribute("cart"); // Optional: keep for preview
%>
<!DOCTYPE html>
<html>
<head>
    <title>Receipt</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            padding: 40px;
            background-color: #f7f7f7;
        }

        .receipt {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .total {
            font-weight: bold;
        }

        .actions {
            margin-top: 30px;
            text-align: center;
        }

        .actions a, .actions button {
            margin: 10px;
            padding: 12px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .actions a:hover, .actions button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="receipt">
    <h2>🧾 Sale Receipt</h2>
    <p>Sale ID: <strong><%= saleId %></strong></p>
    <p>Date: <strong><%= new java.util.Date() %></strong></p>

    <table>
        <thead>
        <tr>
            <th>Product ID</th>
            <th>Qty</th>
            <th>Subtotal (Rs)</th>
        </tr>
        </thead>
        <tbody>
        <% if (cart != null) {
            for (SaleItem item : cart) { %>
            <tr>
                <td><%= item.getProductId() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= String.format("%.2f", item.getSubtotal()) %></td>
            </tr>
        <%  }
        } else { %>
            <tr>
                <td colspan="3">No items found.</td>
            </tr>
        <% } %>
        </tbody>
        <tfoot>
        <tr class="total">
            <td colspan="2">Total:</td>
            <td>Rs. <%= String.format("%.2f", totalAmount) %></td>
        </tr>
        </tfoot>
    </table>

    <div class="actions">
        <button onclick="window.print()">🖨️ Print Receipt</button>
        <a href="index.jsp">🏠 Back to Dashboard</a>
        <a href="sales?action=new">➕ Start New Sale</a>
    </div>
</div>

</body>
</html>
