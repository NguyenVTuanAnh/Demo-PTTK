package com.javaweb.libman.servlet;

import com.javaweb.libman.dao.ReaderDAO;
import com.javaweb.libman.dao.StaffDAO;
import com.javaweb.libman.model.Reader;
import com.javaweb.libman.model.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/create-reader")
public class CreateReaderServlet extends HttpServlet {
    private ReaderDAO readerDAO;

    @Override
    public void init() {
        readerDAO = new ReaderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("create-reader.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        LocalDate birth = LocalDate.parse(req.getParameter("birth"));
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String companyAddress = req.getParameter("companyAddress");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Reader reader = new Reader( name,  birth,  gender,  phone,  email,  address,
                companyAddress,  username,  password,  "READER",  "this is note of reader");

        boolean success = readerDAO.createReader(reader);

        if (success) {
            req.setAttribute("message", "Staff created successfully!");
        } else {
            req.setAttribute("message", "Error creating staff!");
        }

        req.getRequestDispatcher("create-reader.jsp").forward(req, resp);
    }
}
