package com.javaweb.libman.dao;


import com.javaweb.libman.model.Manager;
import com.javaweb.libman.model.Reader;
import com.javaweb.libman.model.Staff;
import com.javaweb.libman.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

public class UserDAO extends DAO {

    public User getUserByUsername(String username, String password) {
        String sql = "select * from user where username = ? AND password = ?;";

        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name") != null ? rs.getString("name") : "";
                LocalDate birth =
                        rs.getDate("birth") != null ? rs.getDate("birth").toLocalDate() : null;
                String gender = rs.getString("gender") != null ? rs.getString("gender") : "";
                String phone = rs.getString("phone") != null ? rs.getString("phone") : "";
                String email = rs.getString("email") != null ? rs.getString("email") : "";
                String address = rs.getString("address") != null ? rs.getString("address") : "";
                String companyAddress = rs.getString("company_address") != null ? rs.getString("company_address") : "";
                String role = rs.getString("role") != null ? rs.getString("role") : "";
                switch (role) {
                    case "MANAGER":
                        Manager manager = new Manager(name, birth, gender, phone
                                , email, address, companyAddress, username, password, role);
                        return manager;

                    case "READER":
                        Reader reader = new Reader(id, name, birth, gender, phone
                                , email, address, companyAddress, username, password, role, "this is note of reader");
                        return reader;
                    case "STAFF":
                        Staff staff = new Staff(name, birth, gender, phone
                                , email, address, companyAddress, username, password, role);
                        return staff;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
