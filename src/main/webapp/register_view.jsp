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
      border: 5px black solid;
    }
    input{
      margin: 15px;
      width: 300px;
      height: 40px;
    }
  </style>
</head>
<body>
<h1>거꾸로 레시피</h1>
<form  onsubmit="return test()" method=post action=joinAction.jsp>
  <div id="register_div">
    <p>< 회원가입 ></p>
    <label for="username">아이디</label>
    <input id="username" type="text" name="username">
    <label for="password">비밀번호</label>
    <input id="password" type="password" name="password">
    <label for="password_chk">비밀번호 확인</label>
    <input id="password_chk" type="password" name="password_chk">
    <label for="email">이메일</label>
    <input id="email" type="email" name="email">
    <input type="submit"  value="가입하기">
  </div>
</form>
<script>
  function test() {
    var p1 = document.getElementById('password').value;
    var p2 = document.getElementById('password_chk').value;
    if( p1 !== p2 ) {
      alert("비밀번호가 일치 하지 않습니다");
      return false;
    } else{
      alert("비밀번호가 일치합니다");
      return true;
    }

  }
</script>
</body>
</html>