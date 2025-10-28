package com.javaweb.libman.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class DAO {
    private static final String URL = "jdbc:mysql://localhost:3306/libman?useSSL=false&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";


    // Hàm dùng chung cho tất cả DAO
    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Not Found", e);
        }
    }
}
