package com.javaweb.libman.dao;

import com.javaweb.libman.model.Reader;

import java.sql.*;

public class ReaderDAO extends DAO{

    public boolean createReader(Reader reader){
        String sqlUser = """
            INSERT INTO user (name, birth, gender, phone, email, address, company_address, username, password, role)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
        """;

        String sqlReader = """
            INSERT INTO reader (user_id, note)
            VALUES (?, ?)
        """;
        Connection conn = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // start transaction

            // insert to tblUser
            PreparedStatement stmt = conn.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, reader.getName());
            stmt.setDate(2, java.sql.Date.valueOf(reader.getBirth()));
            stmt.setString(3, reader.getGender());
            stmt.setString(4, reader.getPhone());
            stmt.setString(5, reader.getEmail());
            stmt.setString(6, reader.getAddress());
            stmt.setString(7, reader.getCompanyAddress());
            stmt.setString(8, reader.getUsername());
            stmt.setString(9, reader.getPassword());
            stmt.setString(10, reader.getRole().toString());
            stmt.executeUpdate();

            // insert to tbl reader
            ResultSet rs = stmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            } else {
                throw new SQLException("Không lấy được user_id sau khi insert user!");
            }
            stmt = conn.prepareStatement(sqlReader);
            stmt.setInt(1, userId);
            stmt.setString(2, "this is note of reader");
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
