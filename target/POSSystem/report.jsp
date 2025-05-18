<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.mycompany.possystem.model.Sale" %>
<%
    List<Sale> salesList = (List<Sale>) request.getAttribute("salesList");
    double totalRevenue = (Double) request.getAttribute("totalRevenue");
    String reportType = (String) request.getAttribute("reportType");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Sales Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f0f0f0;
        }

        h1 {
            text-align: center;
        }

        .buttons {
            text-align: center;
            margin: 20px 0;
        }

        .buttons a {
            padding: 10px 16px;
            margin: 0 10px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .buttons a:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        .total {
            font-weight: bold;
            font-size: 18px;
            text-align: right;
            margin-top: 20px;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
        }

        .footer a {
            color: #2c3e50;
            text-decoration: none;
        }
    </style>
</head>
<body>

<h1>📊 <%= reportType.substring(0, 1).toUpperCase() + reportType.substring(1) %> Sales Report</h1>

<div class="buttons">
    <a href="report?type=daily">📅 Daily</a>
    <a href="report?type=weekly">📆 Weekly</a>
    <a href="report?type=monthly">🗓️ Monthly</a>
    <a href="index.jsp">🏠 Dashboard</a>
</div>

<table>
    <thead>
        <tr>
            <th>Sale ID</th>
            <th>Sale Date</th>
            <th>Total Amount (Rs)</th>
        </tr>
    </thead>
    <tbody>
        <% if (salesList != null && !salesList.isEmpty()) {
            for (Sale s : salesList) { %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getSaleDate() %></td>
                    <td><%= String.format("%.2f", s.getTotalAmount()) %></td>
                </tr>
        <%  }
        } else { %>
            <tr>
                <td colspan="3">No sales found for this period.</td>
            </tr>
        <% } %>
    </tbody>
</table>

<div class="total">
    Total Revenue: Rs. <%= String.format("%.2f", totalRevenue) %>
</div>

<div class="footer">
    <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> POS System</p>
</div>

</body>
</html>
