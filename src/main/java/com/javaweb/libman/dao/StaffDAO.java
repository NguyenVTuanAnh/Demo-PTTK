package com.javaweb.libman.dao;

import com.javaweb.libman.model.Staff;

import java.sql.*;

public class StaffDAO extends DAO {

    public boolean createStaff(Staff staff) {
        String sqlUser = """
            INSERT INTO user (name, birth, gender, phone, email, address, company_address, username, password, role)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
        """;

        String sqlLibrarian = """
            INSERT INTO librarian (user_id, on_broad_date)
            VALUES (?, ?)
        """;
        Connection conn = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // start transaction

            // insert to tblUser
            PreparedStatement stmt = conn.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, staff.getName());
            stmt.setDate(2, java.sql.Date.valueOf(staff.getBirth()));
            stmt.setString(3, staff.getGender());
            stmt.setString(4, staff.getPhone());
            stmt.setString(5, staff.getEmail());
            stmt.setString(6, staff.getAddress());
            stmt.setString(7, staff.getCompanyAddress());
            stmt.setString(8, staff.getUsername());
            stmt.setString(9, staff.getPassword());
            stmt.setString(10, staff.getRole().toString());
            stmt.executeUpdate();

            // insert to tbl librarian
            ResultSet rs = stmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            } else {
                throw new SQLException("Không lấy được user_id sau khi insert user!");
            }
            stmt = conn.prepareStatement(sqlLibrarian);
            stmt.setInt(1, userId);
            stmt.setDate(2, java.sql.Date.valueOf(staff.getOnBroadDate()));
            stmt.executeUpdate();

            conn.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ignored) {}

        }
        return false;
    }
    
}
