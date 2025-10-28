package com.javaweb.libman.servlet;

import com.javaweb.libman.dao.ManagerDAO;
import com.javaweb.libman.dao.ReaderDAO;
import com.javaweb.libman.dao.StaffDAO;
import com.javaweb.libman.dao.UserDAO;
import com.javaweb.libman.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private ReaderDAO readerDAO;
    private StaffDAO staffDAO;
    private ManagerDAO managerDAO;
    private UserDAO userDAO;

    public void init() {
        readerDAO = new ReaderDAO();
        staffDAO = new StaffDAO();
        managerDAO = new ManagerDAO();
        userDAO = new UserDAO();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Khi người dùng bấm nút "Login" ở home-reader.jsp, nó vào đây
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Lấy dữ liệu form gửi lên
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userDAO.getUserByUsername(username, password);
        if (username != null && password != null
                && user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            String role = user.getRole();
            switch (role) {
                case "READER":
                    resp.sendRedirect("home-reader.jsp");
                    break;
                case "MANAGER":
                    resp.sendRedirect("home-manager.jsp");
                    break;
                case "STAFF":
                    resp.sendRedirect("home-staff.jsp");
                    break;
            }

        } else {
            req.setAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
