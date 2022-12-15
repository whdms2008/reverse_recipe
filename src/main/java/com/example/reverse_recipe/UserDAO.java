package com.example.reverse_recipe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/recipe";
            String dbID = "root";
            String dbPassword = "!dudnqlbn6600qe";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    public int login(String userID, String password) {
        String SQL = "SELECT password FROM user WHERE username = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(password))
                    return 1; //로그인 성공
                else
                    return 0; // 비밀번호 틀림
            }
            return -1; // 아이디 없음
        }catch(Exception e) {
            e.printStackTrace();

        }
        return -2; //DB 오류
    }

    public int join(useBean user) {
        String SQL = "INSERT INTO user VALUES(?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            return pstmt.executeUpdate(); // 0이상 값이 return된 경우 성공
        }catch(Exception e) {
            e.printStackTrace();

        }
        return -1; //DB 오류
    }
}