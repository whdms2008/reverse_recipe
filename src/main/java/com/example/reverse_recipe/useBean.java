package com.example.reverse_recipe;

public class useBean {
    private String username;
    private String email;
    private String password;
    private String create_time;


    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword() {
        return this.password;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return this.email;
    }
    public String getCreate_time(){
        return this.create_time;
    }
}


