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
    h1{
      text-align: center;
      border: 5px black solid;
    }
    input{
      margin: 15px;
      width: 300px;
      height: 40px;
    }

    body {
      font-family: sans-serif;
    }
    .form-container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      display: block;
      font-weight: bold;
      margin-bottom: 8px;
    }
    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    input[type="submit"] {
      width: 100%;
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
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
    input[type="submit"]:hover {
      background-color: #45a049;
    }
    #password-strength {
      display: none;
      margin-top: 8px;
      font-size: 12px;
      color: #999;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h1>회원가입 페이지</h1>
  <form onsubmit="return test()" action=joinAction.jsp  method="post">
    <div class="form-group">
      <label for="username">아이디: </label>
      <input type="text" id="username" name="username">
    </div>
    <div class="form-group">
      <label for="password">비밀번호:</label>
      <input oninput="checkPasswordStrength()" type="password" id="password" name="password">
      <span id="password-strength"></span>
    </div>
    <div class="form-group">
      <label for="password_chk">비밀번호 확인: </label>
      <input type="password" id="password_chk" name="password_chk">
    </div>
    <div class="form-group">
      <label for="email">이메일:</label>
      <input type="email" id="email" name="email">
    </div>
    <div class="form-group">
      <input type="submit" value="가입하기">
      <input type="button" onclick="location.href='index.jsp'" value="메인화면">
    </div>
  </form>
</div>
<script>
  function checkPasswordStrength() {
    var password = document.getElementById("password").value;
    var strength = 0;
    if (password.length >= 8) {
      strength += 1;
    }
    if (password.match(/[A-Z]/)) {
      strength += 1;
    }
    if (password.match(/[a-z]/)) {
      strength += 1;
    }
    if (password.match(/\d+/)) {
      strength += 1;
    }
    if (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)) {
      strength += 1;
    }
    let strengthIndicator = document.getElementById("password-strength");
    strengthIndicator.style.display = "block";
    if (strength < 2) {
      strengthIndicator.innerHTML = "빈약함";
    } else if (strength === 2) {
      strengthIndicator.innerHTML = "좋음";
    } else if (strength === 3) {
      strengthIndicator.innerHTML = "강력함";
    } else {
      strengthIndicator.innerHTML = "매우 강력함";
    }
  }
  function test() {
    var p1 = document.getElementById('password').value;
    var p2 = document.getElementById('password_chk').value;
    if( p1 !== p2) {
      alert("비밀번호가 일치 하지 않습니다");
      return false;
    } else if( p1 !== "" && p2 !== ""){

      alert("비밀번호가 일치합니다");
      return true;
    } else{
      alert("암호를 입력해주세요");
      return false;
    }
  }
</script>
</body>
</html>
