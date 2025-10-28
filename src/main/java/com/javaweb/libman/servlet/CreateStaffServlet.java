package com.javaweb.libman.servlet;

import com.javaweb.libman.dao.StaffDAO;
import com.javaweb.libman.model.Staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/create-staff")
public class CreateStaffServlet extends HttpServlet {
    private StaffDAO staffDao;

    @Override
    public void init() {
        staffDao = new StaffDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("create-staff.jsp").forward(req, resp);
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
        LocalDate onBroadDate = LocalDate.now();

        Staff staff = new Staff( name,  birth,  gender,  phone,  email,  address,
                 companyAddress,  username,  password,  "MANAGER",  onBroadDate);

        boolean success = staffDao.createStaff(staff);

        if (success) {
            req.setAttribute("message", "Staff created successfully!");
        } else {
            req.setAttribute("message", "Error creating staff!");
        }

        req.getRequestDispatcher("create-staff.jsp").forward(req, resp);
    }
}
