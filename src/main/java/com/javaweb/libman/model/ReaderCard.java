package com.javaweb.libman.model;

import java.time.LocalDate;

public class ReaderCard {
    private int id;
    private LocalDate issueDate;
    private LocalDate expiryDate;
    private String note;
    private Reader reader;

    public ReaderCard() {
    }

    public ReaderCard(LocalDate issueDate, LocalDate expiryDate, String note, Reader reader) {
        this.issueDate = issueDate;
        this.expiryDate = expiryDate;
        this.note = note;
        this.reader = reader;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(LocalDate issueDate) {
        this.issueDate = issueDate;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
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
}
