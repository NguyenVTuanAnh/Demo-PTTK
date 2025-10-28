package com.javaweb.libman.model;

import java.time.LocalDate;
import java.util.List;

public class BorrowSlip {
    private int id;
    private LocalDate borrowDate;
    private LocalDate dueDate;
    private String note;
    private Reader reader;
    private Staff staff;
    private List<BorrowDetail> borrowDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(LocalDate borrowDate) {
        this.borrowDate = borrowDate;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }

    public void setDueDate(LocalDate dueDate) {
        this.dueDate = dueDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public List<BorrowDetail> getBorrowDetails() {
        return borrowDetails;
    }

    public void setBorrowDetails(List<BorrowDetail> borrowDetails) {
        this.borrowDetails = borrowDetails;
    }
}
