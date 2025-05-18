package com.mycompany.possystem.servlet;

import com.mycompany.possystem.dao.SalesDAO;
import com.mycompany.possystem.model.Sale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.*;
import java.util.List;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
    private SalesDAO salesDAO;

    @Override
    public void init() {
        salesDAO = new SalesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");

        // Default to "daily" if no type is provided
        if (type == null) type = "daily";

        LocalDate now = LocalDate.now();
        Timestamp start = null;
        Timestamp end = null;

        switch (type) {
            case "daily":
                start = Timestamp.valueOf(now.atStartOfDay());
                end = Timestamp.valueOf(now.plusDays(1).atStartOfDay());
                break;

            case "weekly":
                LocalDate startOfWeek = now.with(DayOfWeek.MONDAY);
                LocalDate endOfWeek = startOfWeek.plusDays(7);
                start = Timestamp.valueOf(startOfWeek.atStartOfDay());
                end = Timestamp.valueOf(endOfWeek.atStartOfDay());
                break;

            case "monthly":
                LocalDate startOfMonth = now.withDayOfMonth(1);
                LocalDate startOfNextMonth = startOfMonth.plusMonths(1);
                start = Timestamp.valueOf(startOfMonth.atStartOfDay());
                end = Timestamp.valueOf(startOfNextMonth.atStartOfDay());
                break;

            default:
                start = Timestamp.valueOf(now.atStartOfDay());
                end = Timestamp.valueOf(now.plusDays(1).atStartOfDay());
        }

        List<Sale> salesList = salesDAO.getSalesBetween(start, end);
        double totalRevenue = salesList.stream().mapToDouble(Sale::getTotalAmount).sum();

        request.setAttribute("salesList", salesList);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("reportType", type);

        request.getRequestDispatcher("report.jsp").forward(request, response);
    }
}
