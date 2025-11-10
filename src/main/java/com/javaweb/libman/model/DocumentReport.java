package com.javaweb.libman.model;

public class DocumentReport extends Document{
    private int totalLoans;

    public DocumentReport(int id, String name, String type, int totalLoans) {
        super(id, name, type);
        this.totalLoans = totalLoans;
    }

    public int getTotalLoans() {
        return totalLoans;
    }

    public void setTotalLoans(int totalLoans) {
        this.totalLoans = totalLoans;
    }

}
