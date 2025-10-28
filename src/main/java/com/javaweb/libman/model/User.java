package com.javaweb.libman.model;

import java.time.LocalDate;

public abstract class User {

    private int id;
    private String name;
    private LocalDate birth;
    private String gender;
    private String phone;
    private String email;
    private String address;
    private String companyAddress;
    private String username;
    private String password;
    private String role;

    public User() {
    }

    public User(String password, String username) {
        this.password = password;
        this.username = username;
    }

    public User(int id, String name, LocalDate birth, String gender, String phone, String email,
                String address, String companyAddress, String username, String password, String role) {
        this.id = id;
        this.name = name;
        this.birth = birth;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.companyAddress = companyAddress;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(String name, LocalDate birth, String gender, String phone,
                String email, String address, String companyAddress,
                String username, String password, String role) {
        this.name = name;
        this.birth = birth;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.companyAddress = companyAddress;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirth() {
        return birth;
    }

    public void setBirth(LocalDate birth) {
        this.birth = birth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
