package com.example.reverse_recipe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginSession")
public class loginSession extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        int result = dao.login(req.getParameter("username"), req.getParameter("password"));
        if(result == 1){

            HttpSession session = req.getSession();
            String username = req.getParameter("username");
            session.setAttribute("username",username);
            resp.sendRedirect("index.jsp");
        }else if(result == -1){
            resp.sendRedirect("loginAction.jsp");
        }
    }
}
