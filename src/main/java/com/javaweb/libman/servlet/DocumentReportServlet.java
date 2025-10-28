package com.javaweb.libman.servlet;

import com.javaweb.libman.dao.DocumentReportDAO;
import com.javaweb.libman.model.DocumentReport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/document-report")
public class DocumentReportServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("document-report.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");

        LocalDate startDate = (startDateStr != null && !startDateStr.isEmpty())
                ? LocalDate.parse(startDateStr)
                : null;
        LocalDate endDate = (endDateStr != null && !endDateStr.isEmpty())
                ? LocalDate.parse(endDateStr)
                : null;
        DocumentReportDAO documentReportDAO = new DocumentReportDAO();
        List<DocumentReport> reports = documentReportDAO.getBorrowedDocumentInPeriod(startDate, endDate);

        int totalLoans = reports.stream().mapToInt(DocumentReport::getTotalLoans).sum();

        req.setAttribute("documentReportList", reports);
        req.setAttribute("totalLoans", totalLoans);

        // hidden attr for next ui
        HttpSession session = req.getSession();
        session.setAttribute("startDate", startDate);
        session.setAttribute("endDate", endDate);
        req.getRequestDispatcher("document-report.jsp").forward(req, resp);
    }
}
