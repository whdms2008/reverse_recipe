package com.example.reverse_recipe;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/check_username")
public class check_username extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the password from the request
        String password = request.getParameter("username");

        // Check the password
        if (isUsernameCorrect(password)) {
            // Password is correct
            response.setStatus(200);
        } else {
            // Password is incorrect
            response.setStatus(401);
        }
    }
    public boolean isUsernameCorrect(String username){
        UserDAO dao = new UserDAO();
        return dao.isUsernameCorrect(username);
    }
}
