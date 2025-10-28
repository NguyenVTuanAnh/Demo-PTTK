package com.javaweb.libman.model;

public class DocumentReport {
    private int documentId;
    private String documentName;
    private int totalLoans;

    public DocumentReport(int documentId, String documentName, int totalLoans) {
        this.documentId = documentId;
        this.documentName = documentName;
        this.totalLoans = totalLoans;
    }

    public int getDocumentId() {
        return documentId;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public int getTotalLoans() {
        return totalLoans;
    }

    public void setTotalLoans(int totalLoans) {
        this.totalLoans = totalLoans;
    }
}
