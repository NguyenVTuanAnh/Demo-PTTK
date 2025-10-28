package com.javaweb.libman.model;

public class BorrowDetail {

    private int id;
    private Document document;

    public BorrowDetail() {
    }

    public BorrowDetail(int id, Document document) {
        this.id = id;
        this.document = document;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }
}
