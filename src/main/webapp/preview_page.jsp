<%@ page import="com.example.reverse_recipe.UserDAO" %>
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

        h1 {
            text-align: center;
        }

        .favorite {
            border-color: red;
        }

        .favorites {
            width: 50%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            flex-direction: column;
            align-content: space-around;
            border: solid 1px;
            border-radius: 15px;
            padding-bottom: 30px;
        }

        .review, .favorite {
            width: 20%;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }
        .favorite{
            border-color: red;
        }
        .reviews {
            width: 50%;
            height: 80%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            flex-direction: column;
            align-content: space-around;
            border: solid 1px;
            border-radius: 15px;
            padding-bottom: 30px;
            align-items: center;
        }
        .favorites {
            width: 50%;
            display: flex;
            height: 80%;
            flex-wrap: wrap;
            justify-content: center;
            flex-direction: column;
            align-content: space-around;
            border: solid 1px;
            border-radius: 15px;
            padding-bottom: 30px;
        }

        .review p, .favorite p {
            margin: 0;
        }
        
        .review:hover{
            cursor: pointer;
            background: #d3d3d3;
        }

        .favorite:hover{
            cursor: pointer;
            background: #d3d3d3;
        }
        
        #write_review_and_favorite_review {
            display: flex;
            align-items: center;
        }
        .main_menu_btn{
            width: 50%;
            color: white;
            border: 1px solid #ccc;
            background: gray;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            box-shadow: 2px 2px 5px rgb(0 0 0 / 10%);
        }
        .main_menu_btn:hover{
            cursor: pointer;
            background: #c7c7c7;
        }
    </style>
</head>
<body id="write_review_and_favorite_review">
<% UserDAO dao = new UserDAO();
    dao.write_review(request, response);
%>
<% dao = new UserDAO();
    dao.write_favorite_review(request, response);
%>
</body>
</html>
