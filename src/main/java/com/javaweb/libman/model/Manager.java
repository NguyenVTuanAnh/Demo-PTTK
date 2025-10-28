package com.javaweb.libman.model;

import java.time.LocalDate;

public class Manager extends User{

    private LocalDate onBroadDate;

    public Manager() {
    }

    public Manager(String name, LocalDate birth, String gender, String phone,
                   String email, String address, String companyAddress,
                   String username, String password, LocalDate onBroadDate, String role) {
        super(name, birth, gender, phone, email, address, companyAddress, username, password, role);
        this.onBroadDate = onBroadDate;
    }

    public Manager(String name, LocalDate birth, String gender, String phone, String email
            , String address, String companyAddress, String username, String password, String role) {
        super(name, birth, gender, phone, email, address, companyAddress, username, password, role);
    }

    public LocalDate getOnBroadDate() {
        return onBroadDate;
    }

    public void setOnBroadDate(LocalDate onBroadDate) {
        this.onBroadDate = onBroadDate;
    }
}
