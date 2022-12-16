<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
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
      border: 5px black solid;
    }
    input{
      margin: 15px;
      width: 300px;
      height: 40px;
    }
    #login_go{
      width: 300px;
      height: 40px;
    }
  </style>
</head>
<body>
<h1>거꾸로 레시피</h1>
<form name=student method=post action=loginAction.jsp>
  <div id="register_div">
    <p>< 로그인 ></p>
    <label for="username">아이디</label>
    <input id="username" type="text" name="username">

    <label for="password">비밀번호</label>
    <input id="password" type="password" name="password">

    <input id="login_go" type="submit" value="로그인 하기">
  </div>
</form>
</body>
</html>