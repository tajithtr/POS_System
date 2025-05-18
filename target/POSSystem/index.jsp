<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>POS System Dashboard</title>
    <!-- Link to your custom Tailwind-based CSS -->
    <link href="style.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="dashboard-container">
        <h1 class="dashboard-title">Welcome to the POS System</h1>

        <div class="dashboard-buttons">
            <a href="products" class="dashboard-link bg-blue-500 hover:bg-blue-600">
                🛒 Manage Products
            </a>
            <a href="sales?action=new" class="dashboard-link bg-green-500 hover:bg-green-600">
                💳 Start New Sale
            </a>
            <a href="report?type=daily" class="dashboard-link bg-purple-500 hover:bg-purple-600">
                📊 View Sales Report
            </a>
        </div>

        <p class="dashboard-footer">Powered by <strong>Servlets & JSP</strong></p>
    </div>

</body>
</html>
