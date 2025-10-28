package com.javaweb.libman.dao;

import com.javaweb.libman.model.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class BorrowSlipDAO extends DAO{

    public List<BorrowSlip> getBorrowSlipList(LocalDate startDate, LocalDate endDate, int documentId){
        List<BorrowSlip> list = new ArrayList<>();

        String sql = """
            SELECT DISTINCT
                bs.id AS borrow_slip_id,
                bs.borrow_date,
                bs.due_date,
                bs.note,
                
                u_reader.id as reader_id,
                u_reader.name AS reader_name,
                
                u_librarian.id as librarian_id,
                u_librarian.name AS librarian_name
            
            FROM borrow_slip bs
            JOIN borrow_detail bd
                ON bs.id = bd.borrow_slip_id
            JOIN document d
                ON d.id = bd.document_id
            JOIN reader r
                ON bs.reader_id = r.id
            JOIN user u_reader
                ON r.user_id = u_reader.id
            JOIN librarian l
                ON bs.librarian_id = l.id
            JOIN user u_librarian
                ON l.user_id = u_librarian.id
            
            WHERE d.id = ?
              AND (? IS NULL OR bs.borrow_date >= ?)
              AND (? IS NULL OR bs.borrow_date <= ?)
            
            ORDER BY bs.borrow_date ASC;
        """;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, documentId);

            if (startDate != null) {
                ps.setDate(2, Date.valueOf(startDate));
                ps.setDate(3, Date.valueOf(startDate));
            } else {
                ps.setNull(2, Types.DATE);
                ps.setNull(3, Types.DATE);
            }

            if (endDate != null) {
                ps.setDate(4, Date.valueOf(endDate));
                ps.setDate(5, Date.valueOf(endDate));
            } else {
                ps.setNull(4, Types.DATE);
                ps.setNull(5, Types.DATE);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BorrowSlip bs = new BorrowSlip();
                bs.setId(rs.getInt("borrow_slip_id"));
                bs.setBorrowDate(rs.getDate("borrow_date").toLocalDate());
                bs.setDueDate(rs.getDate("due_date").toLocalDate());
                bs.setNote(rs.getString("note"));

                // Reader info
                Reader reader = new Reader();
                reader.setId(rs.getInt("reader_id"));
                reader.setName(rs.getString("reader_name"));
                bs.setReader(reader);

                list.add(bs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public BorrowSlip getBorrowSlip(int borrowSlipId){

        String sql = """
        SELECT distinct 
                bs.id AS borrow_slip_id,
                bs.borrow_date,
                bs.due_date,
                bs.note,
                
                d.name as document_name,
                d.id as document_id,
                
                u_reader.id as reader_id,
                u_reader.name AS reader_name,
                
                u_librarian.id as librarian_id,
                u_librarian.name AS librarian_name
                
            FROM borrow_slip bs
            JOIN borrow_detail bd
                ON bs.id = bd.borrow_slip_id
            JOIN document d
                ON d.id = bd.document_id
            JOIN reader r
                ON bs.reader_id = r.id
            JOIN user u_reader
                ON r.user_id = u_reader.id
            JOIN librarian l
                ON bs.librarian_id = l.id
            JOIN user u_librarian
                ON l.user_id = u_librarian.id
            
            WHERE bs.id = ?;
        """;
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, borrowSlipId);
            ResultSet rs = ps.executeQuery();
            BorrowSlip bs = null;
            List<BorrowDetail> borrowDetailList = new ArrayList<>();
            while (rs.next()) {
                if (bs == null) {
                    bs = new BorrowSlip();
                    bs.setId(rs.getInt("borrow_slip_id"));
                    Date borrowDate = rs.getDate("borrow_date");
                    Date dueDate = rs.getDate("due_date");
                    LocalDate localDate1 = borrowDate.toLocalDate();
                    LocalDate localDate2 = dueDate.toLocalDate();

                    bs.setBorrowDate(localDate1);
                    bs.setDueDate(localDate2);
                    bs.setNote(rs.getString("note"));

                    Reader reader = new Reader();
                    reader.setId(rs.getInt("reader_id"));
                    reader.setName(rs.getString("reader_name"));
                    bs.setReader(reader);

                    Staff staff = new Staff();
                    staff.setId(rs.getInt("librarian_id"));
                    staff.setName(rs.getString("librarian_name"));
                    bs.setStaff(staff);
                }
                BorrowDetail bd = new BorrowDetail();
                Document document = new Document();
                document.setId(rs.getInt("document_id"));
                document.setName(rs.getString("document_name"));
                bd.setDocument(document);
                borrowDetailList.add(bd);
            }
            if (bs != null){
                bs.setBorrowDetails(borrowDetailList);
            }
            return bs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

