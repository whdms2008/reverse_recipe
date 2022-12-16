<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.reverse_recipe.UserDAO" %>
<%@ page import="java.util.Objects" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.example.reverse_recipe.useBean" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:getProperty name="user" property="username"/>
<jsp:getProperty name="user" property="password"/>
<% // ---> 2.
    PrintWriter script = response.getWriter();
    if (user.getUsername() == null || user.getPassword() == null) {
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else {
        UserDAO us = new UserDAO();
        int result = us.login(user.getUsername(), user.getPassword());
        if (result == 1) {

            script.println("<script>");
            script.println("alert('로그인 성공!')");
            script.println("history.back()");
            script.println("</script>");
        } else {

            script.println("<script>");
            script.println("alert('아이디 또는 비밀번호가 올바르지 않습니다!')");
            script.println("history.back()");
            script.println("</script>");
        }
    }
%>
</body>
</html>