<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        table{
            text-align: center;

        }
        button{
            float:right;
            width:100px;
            height: 50px;
        }
    </style>
</head>
<body>
<h1>거꾸로 레시피</h1>
<button onclick="location='index.jsp'">처음으로</button>
<table border=1 width="100%">
    <tr>
        <th>내가 작성한 리뷰</th>
        <th>즐겨찾기한 레시피</th>
    </tr>
    <tr>
        <td>육개장</td>
        <td>계란말이</td>
    </tr>
    <tr>
        <td>육개장</td>
        <td>계란말이</td>
    </tr>
</table>
</body>
</html>
