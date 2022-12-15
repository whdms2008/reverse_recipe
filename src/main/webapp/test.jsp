<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예제 grade</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<form name=student method=post action=joinAction.jsp>
  <table>
    <tr bgcolor="yellow">
      <td align=center colspan=2><b>학생 정보</b></td>
    </tr>
    <tr>
      <td align="right">아이디: </td>
      <td><input type="text" name="username"> </td>
    </tr>
    <tr>
      <td align="right">암호 : </td>
      <td><input type="password" name="password" > </td>
    </tr>
    <tr>
      <td align="right">이메일 : </td>
      <td><input type="text" name="email" ></td>
  </table>
  <input type="submit" value="전송하기">
  <input type="reset" value="다시쓰기">
</form>
</body>
</html>