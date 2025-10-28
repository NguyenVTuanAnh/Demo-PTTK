package com.javaweb.libman.servlet;


import com.javaweb.libman.dao.BorrowSlipDAO;
import com.javaweb.libman.model.BorrowSlip;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/document-detail-report")
public class DocumentDetailReportServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1️ Nhận các tham số từ request
        String documentIdStr = req.getParameter("documentId");
        String documentName = req.getParameter("documentName");

        // 2️ Lấy startDate, endDate từ session (đã lưu ở servlet DocumentReport)
        HttpSession session = req.getSession(false);
        LocalDate startDate = null;
        LocalDate endDate = null;
        if (session != null) {
            Object startObj = session.getAttribute("startDate");
            Object endObj = session.getAttribute("endDate");
            if (startObj instanceof LocalDate) startDate = (LocalDate) startObj;
            if (endObj instanceof LocalDate) endDate = (LocalDate) endObj;
        }

        // 3️ Kiểm tra documentId hợp lệ
        if (documentIdStr == null || documentIdStr.isEmpty()) {
            resp.sendRedirect("document-report.jsp");
            return;
        }
        int documentId = Integer.parseInt(documentIdStr);

        // 4️ Lấy danh sách phiếu mượn chi tiết trong khoảng thời gian đã lọc
        BorrowSlipDAO borrowSlipDAO = new BorrowSlipDAO();
        List<BorrowSlip> borrowSlipList = borrowSlipDAO.getBorrowSlipList(startDate, endDate, documentId);

        // 5️ Truyền dữ liệu sang JSP
        req.setAttribute("borrowSlipList", borrowSlipList);
        req.setAttribute("documentName", documentName);
        req.setAttribute("totalLoans", borrowSlipList.size());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        req.setAttribute("startDate", startDate != null ? startDate.format(formatter)
                : null);
        req.setAttribute("endDate", endDate != null ? endDate.format(formatter)
                : null);

        // 6️ Chuyển tiếp sang trang JSP hiển thị
        req.getRequestDispatcher("document-detail-report.jsp").forward(req, resp);
    }
}


