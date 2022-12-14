package com.example.reverse_recipe;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

// 인증키 : 93015fe6a0fa49d9a7da


@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class Add_Ingredient extends HttpServlet {
    private String[] ingredient;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {


    }

    public void destroy() {
    }
}