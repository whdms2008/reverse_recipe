
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<INPUT type="text" name="menu">
<TEXTAREA placeholder="내용을 입력해주세요" name="text"></TEXTAREA>
<button onclick="register()">리뷰등록</button>

<button onclick="location.href='index.jsp'">뒤로가기</button>
<script>
   function register(){
        alert('리뷰가 등록되었습니다');
}</script>
</body>
</html>
