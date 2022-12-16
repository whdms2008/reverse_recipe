<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        try {
            Context context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
            ds.getConnection();

            System.out.println("DB연동 성공");
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</head>
<body>
<h1>리뷰작성</h1>
<style>
    @font-face {
        font-family: 'S-CoreDream-3Light';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    * {
        font-family: "S-CoreDream-3Light", serif;
    }
    h1{
        text-align : center;
        border:5px black solid;
    }
    textarea{
        width:100%;
        height: 50%;
        font-size: 15px;
    }
    input{
        width:100%;
        height: 10%;
        font-size: 20px;
    }
    button{
        float:right;
        width:100px;
        height: 50px;
    }
</style>
<input type="text" name="menu">
<textarea placeholder="내용을 입력해주세요" name="text"></textarea>
<form action="">

</form>
<button onclick="register()">리뷰등록</button>

<button onclick="history.back()">뒤로가기</button>
<script>
   function register(){
        alert('리뷰가 등록되었습니다');
}</script>
</body>
</html>
