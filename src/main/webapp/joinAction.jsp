<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.example.reverse_recipe.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Objects" %>
<jsp:useBean id="user" class="com.example.reverse_recipe.useBean" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <% request.setCharacterEncoding("UTF-8");%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:getProperty name="user" property="username"/>
<jsp:getProperty name="user" property="password"/>
<jsp:getProperty name="user" property="email"/>
<% // ---> 2.

    PrintWriter script = response.getWriter();
    UserDAO userDAO = new UserDAO();
    if (user.getUsername() == null || user.getPassword() == null || user.getEmail() == null) {
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else {  // ---> 3.

        int result = userDAO.join(user);
        if (result == -1) {
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("location.href = 'index.jsp'");
            script.println("</script>");
        }
    }
%>
</body>
</html>