package com.javaweb.libman.dao;

import com.javaweb.libman.model.ReaderCard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReaderCardDAO extends DAO{

    public boolean addCard(ReaderCard readerCard){
//        String sql = """
//            INSERT INTO reader_card (issue_date, expiry_date, note, reader_id)
//            VALUES (?, ?, ?, ?)
//        """;
        String sql = """
            INSERT INTO reader_card (issue_date, expiry_date, note, reader_id)
            SELECT ?, ?, ?, ?
            WHERE NOT EXISTS (
                SELECT 1 FROM reader_card 
                WHERE reader_id = ? AND expiry_date >= CURRENT_DATE
            )
        """;
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setDate(1, java.sql.Date.valueOf(readerCard.getIssueDate()));
            stmt.setDate(2, java.sql.Date.valueOf(readerCard.getExpiryDate()));
            stmt.setString(3, readerCard.getNote());
            stmt.setInt(4, readerCard.getReader().getId());
            stmt.setInt(5, readerCard.getReader().getId());
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
