package com.javaweb.libman.dao;

import com.javaweb.libman.model.DocumentReport;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DocumentReportDAO extends DAO{
    public List<DocumentReport> getBorrowedDocumentInPeriod(LocalDate startDate, LocalDate endDate){
        List<DocumentReport> list = new ArrayList<>();
        String sql = "SELECT " +
                " d.id, d.name, d.type, COUNT(bd.document_id) AS total_loans " +
                "FROM document d " +
                "JOIN borrow_detail bd ON d.id = bd.document_id " +
                "JOIN borrow_slip bs ON bd.borrow_slip_id = bs.id " +
                "WHERE (? IS NULL OR bs.borrow_date >= ?) " +
                "AND (? IS NULL OR bs.borrow_date <= ?) " +
                "GROUP BY d.id, d.name, d.type " +
                "ORDER BY total_loans DESC";
        try{
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            // Set tham số (2 lần vì có ? IS NULL OR ? >= ?)
            if (startDate != null) {
                ps.setDate(1, Date.valueOf(startDate));
                ps.setDate(2, Date.valueOf(startDate));
            } else {
                ps.setNull(1, Types.DATE);
                ps.setNull(2, Types.DATE);
            }

            if (endDate != null) {
                ps.setDate(3, Date.valueOf(endDate));
                ps.setDate(4, Date.valueOf(endDate));
            } else {
                ps.setNull(3, Types.DATE);
                ps.setNull(4, Types.DATE);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DocumentReport(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getInt("total_loans")
                ));
            }

            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
