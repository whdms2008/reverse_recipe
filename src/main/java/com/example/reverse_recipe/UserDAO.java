package com.example.reverse_recipe;

import com.mysql.cj.Session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

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
    public int favorite_chk(HttpServletRequest req) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String username = session.getAttribute("username").toString();
        String food_name = req.getParameter("food_name");
        System.out.println("favorite : " + food_name);
        String insert_SQL = "INSERT INTO favorite_recipe(recipe_name, user_username) VALUES(?, ?)";
        // INSERT INTO favorite_recipe(recipe_name, user_username) VALUES('a','whdms1107');
        String del_QSL = "DELETE FROM favorite_recipe WHERE user_username = ? and recipe_name = ?";
        String SQL = "SELECT recipe_name FROM favorite_recipe WHERE user_username = ? and recipe_name = ?";
        System.out.println(food_name + " , " + username);
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, username);
            pstmt.setString(2, food_name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(food_name)) {
                    return 1; // 값 있음
                }
            }
            return 0; // 값 없음
        }catch(Exception e) {
            e.printStackTrace();

        }
        return -2; //DB 오류
    }
    public int favorite(HttpServletRequest req) throws UnsupportedEncodingException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        String username = session.getAttribute("username").toString();
        String food_name = req.getParameter("food_name");
        System.out.println("favorite : " + food_name);
        String insert_SQL = "INSERT INTO favorite_recipe(recipe_name, user_username) VALUES(?, ?)";
        String del_QSL = "DELETE FROM favorite_recipe WHERE user_username = ? and recipe_name = ?";
        String SQL = "SELECT recipe_name FROM favorite_recipe WHERE user_username = ? and recipe_name = ?";
        System.out.println(food_name + " , " + username);
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, username);
            pstmt.setString(2, food_name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(food_name)) {
                    pstmt = conn.prepareStatement(del_QSL);
                    pstmt.setString(1, username);
                    pstmt.setString(2, food_name);
                    pstmt.executeUpdate();
                    System.out.println(rs.getString(1).equals(food_name));
                    return 1; // 값 있음
                }
            }
            pstmt = conn.prepareStatement(insert_SQL);
            pstmt.setString(1, food_name);
            pstmt.setString(2, username);
            pstmt.executeUpdate();
            return 0; // 값 없음
        }catch(Exception e) {
            e.printStackTrace();

        }
        return -2; //DB 오류
    }
}