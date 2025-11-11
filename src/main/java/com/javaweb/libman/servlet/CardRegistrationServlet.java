package com.javaweb.libman.servlet;

import com.javaweb.libman.dao.ReaderCardDAO;
import com.javaweb.libman.dao.ReaderDAO;
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
import java.time.Instant;
import java.time.LocalDate;
import java.util.Timer;

@WebServlet("/card-registration")
public class CardRegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        // Gửi thông tin user sang JSP
        req.setAttribute("reader", currentUser);
        req.getRequestDispatcher("card-registration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session != null) {
            ReaderCardDAO readerCardDAO = new ReaderCardDAO();

            User currentUser = (User) session.getAttribute("user");
            if (currentUser != null) {
                System.out.println("Người đang đăng nhập: " + currentUser.getName());
            } else {
                resp.sendRedirect("login.jsp");
            }
            Reader reader = (Reader) currentUser;

            int expiry = Integer.parseInt(req.getParameter("expiry"));
            LocalDate issueDate = LocalDate.now();
            LocalDate expiryDate = issueDate.plusMonths(expiry);
            ReaderCard readerCard = new ReaderCard(issueDate, expiryDate, "", reader);

            Boolean success = readerCardDAO.addCard(readerCard);

            if (success) {
                resp.sendRedirect("reader-home.jsp");
            } else {
                req.setAttribute("reader", currentUser);
                req.setAttribute("errorMessage", " Bạn đã có thẻ còn hạn. Không thể đăng ký thêm.");
                req.getRequestDispatcher("card-registration.jsp").forward(req, resp);
            }
        }

    }
}
