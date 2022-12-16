<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>거꾸로 레시피</title>
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
    body {
      background-color: #f4f4f4;
      font-family: Arial, sans-serif;
    }
    .login-container {
      width: 400px;
      margin: 0 auto;
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
    }
    .form-control {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .btn {
      width: 100%;
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .btn:hover {
      background-color: #45a049;
    }


    input[type="button"] {
      width: 100%;
      background-color: #f15353;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h1>거꾸로 레시피</h1>
  <form id="login-form" action="loginSession" method="post">
    <label for="username">아이디:</label><br>
    <input name="username" type="text" id="username" class="form-control" required><br>
    <label for="password">비밀번호:</label><br>
    <input name="password" type="password" id="password" class="form-control" required><br>
    <input type="submit" value="로그인" class="btn">
    <input type="button" onclick="location.href='index.jsp'" value="메인화면">
  </form>
</div>

<script>
  let form = document.getElementById('login-form');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    if (username.length === 0 || password.length === 0) {
      alert('아이디와 비밀번호를 입력해주세요!');
      return;
    }

    // Submit the form
    form.submit();
  });
</script>
</body>
</html>