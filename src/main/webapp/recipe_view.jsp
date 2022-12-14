
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<h1>거꾸로 레시피</h1>
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
    input {
    width:80%;
    height: 10%;
    font-size: 20px;
    }
    textarea{
    width:100%;
    height: 60%;
    font-size: 15px;
    }
    button{
        float:right;
        width:200px;
        height: 50px;
    }

</style>
<article>
    <input type="text" name="menu">
    <span style="font-size: 30px">☆</span>
</article>
<TEXTAREA name="text"></TEXTAREA>
<button>리뷰 남기러 가기</button>
</body>
</html>
