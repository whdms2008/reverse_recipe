package com.example.reverse_recipe;


import java.io.*;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

@WebServlet("/add_review")
public class add_review extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        if(dao.add_review(req) == 1){
            resp.sendRedirect("recipe_view.jsp?food_name=" + URLEncoder.encode(req.getParameter("food_name")));
        }else{
            resp.sendRedirect("index.jsp");
        }
    }
}