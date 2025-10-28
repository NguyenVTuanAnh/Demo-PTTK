package com.javaweb.libman.servlet;

import com.javaweb.libman.dao.BorrowSlipDAO;
import com.javaweb.libman.dao.ReaderCardDAO;
import com.javaweb.libman.model.BorrowSlip;
import com.javaweb.libman.model.Reader;
import com.javaweb.libman.model.ReaderCard;
import com.javaweb.libman.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/borrow-slip")
public class BorrowSlipServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String borrowSlipIdStr = req.getParameter("borrowSlipId");
        int borrowSlipId = Integer.parseInt(borrowSlipIdStr);

        BorrowSlipDAO borrowSlipDAO = new BorrowSlipDAO();
        BorrowSlip borrowSlip = borrowSlipDAO.getBorrowSlip(borrowSlipId);
        req.setAttribute("borrowSlip", borrowSlip);
        req.getRequestDispatcher("borrow-slip.jsp").forward(req, resp);
    }

}
