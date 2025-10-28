package com.javaweb.libman.model;

import java.time.LocalDate;

public class Reader extends User {

    private String note;

    public Reader(String name, LocalDate birth, String gender,
                  String phone, String email, String address, String companyAddress,
                  String username, String password, String role, String note) {
        super(name, birth, gender, phone, email, address, companyAddress, username, password, role);
        this.note = note;
    }

    public Reader(int id, String name, LocalDate birth, String gender, String phone, String email, String address,
                  String companyAddress, String username, String password, String role, String note) {
        super(id, name, birth, gender, phone, email, address, companyAddress, username, password, role);
        this.note = note;
    }

    public Reader() {
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
