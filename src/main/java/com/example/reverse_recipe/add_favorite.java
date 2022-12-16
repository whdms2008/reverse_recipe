package com.example.reverse_recipe;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/favorite")
public class add_favorite extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String food_name = req.getParameter("food_name");
        UserDAO dao = new UserDAO();
        dao.favorite(req);
        resp.setCharacterEncoding("UTF-8");
        resp.sendRedirect("recipe_view.jsp?food_name=" + URLEncoder.encode(food_name, "UTF-8"));
    }
}
