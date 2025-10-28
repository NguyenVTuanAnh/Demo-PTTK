package com.javaweb.libman.model;

import java.time.LocalDate;

public class Staff extends User {

    private LocalDate onBroadDate;

    public Staff() {
    }

    public Staff(String name, LocalDate birth, String gender, String phone, String email, String address,
                 String companyAddress, String username, String password, String role, LocalDate onBroadDate) {
        super(name, birth, gender, phone, email, address, companyAddress, username, password, role);
        this.onBroadDate = onBroadDate;
    }

    public Staff(String name, LocalDate birth, String gender, String phone, String email, String address,
                 String companyAddress, String username, String password, String role) {
        super(name, birth, gender, phone, email, address, companyAddress, username, password, role);
    }

    public LocalDate getOnBroadDate() {
        return onBroadDate;
    }

    public void setOnBroadDate(LocalDate onBroadDate) {
        this.onBroadDate = onBroadDate;
    }
}
