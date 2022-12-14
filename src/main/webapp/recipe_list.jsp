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

        #title {
            text-align: center;
            border: 5px black solid;
        }

        .output {
            border: solid 1px;
            margin: 0 auto;
        }

        .recipe_img {
            width: 170px;
            margin: 20px;
        }

        .recipe {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
        }

        .ok {
            color: green;
            text-decoration-line: line-through;
        }

        .no {
            color: red;
        }
        .recipe_ingredient{
            margin: 30px;
        }
        .recipe_data{
            margin: 0 30px 0 30px;

        }
        body{
            width: 80%;
            margin:0 auto;
        }
        .recipe_name{
            font-size: 35px;
            font-weight: bold;
        }
        .recipe_favorite{
            font-size: 100px;
            margin: 0 60px 0 0;
        }

    </style>
    <h1 id="title">거꾸로 레시피</h1>
</head>
<body >
<article class="output">
    <div class="recipe">
        <img class="recipe_img" src="red.png">
        <div class="recipe_data">
            <p class="recipe_name">육개장</p>
        </div>
        <div class="recipe_ingredient">
            <p>재료 :
                <span class="ok">소고기</span>,
                <span class="ok">고사리</span>,
                <span class="no">채소1</span>,
                <span class="no">채소2</span></p>
            <p>재료 2/4 개 보유중</p>
            <span class="recipe_cook_type">조리방법 : 끓이기</span>
        </div>
        <span class="recipe_favorite">☆</span>
    </div>
</article>
</body>
</html>
