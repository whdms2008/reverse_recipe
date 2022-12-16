<%--
  Created by IntelliJ IDEA.
  User: whdms
  Date: 2022-12-16
  Time: 오후 3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예제 grade</title>
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

    #register_div {
      display: flex;
      flex-direction: column;
      align-items: center;
      font-size: 25px;

    }
    h1{
      text-align: center;
    }
    input{
      margin: 15px;
      width: 200px;
    }
  </style>
</head>
<body>
<h1>거꾸로 레시피 - 로그인</h1>
<form method=post action=loginSession>
  <div id="register_div">
    <label for="username">아이디 : </label>
    <input id="username" type="text" name="username">

    <label for="password">비밀번호 : </label>
    <input id="password" type="password" name="password">
    <input type="submit" value="가입하기">
  </div>
</form>
</body>
</html>