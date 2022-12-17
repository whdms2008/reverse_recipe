<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="style.css" rel="stylesheet" type="text/css">
    <title>JSP - Hello World</title>
    <script>
        function add_ingredient() {
            console.log("추가됨");
            if (document.getElementById("add_ingredient_preview_div").childElementCount < 10) {
                if (document.getElementById("add_ingredient_input").value !== "") {

                    let ingredient = document.createElement("input");
                    let preivew = document.getElementById("add_ingredient_preview_div");
                    let value = document.getElementById("add_ingredient_input");
                    ingredient.setAttribute("class", "ingredient");
                    ingredient.name = "ingredient";
                    ingredient.type = "text";
                    ingredient.value = value.value;
                    // ingredient.style.textAlign = "center";
                    // ingredient.style.margin = "10px";
                    // ingredient.style.padding = "10px";
                    // ingredient.width = "60px";
                    // ingredient.disabled = true;
                    value.value = "";
                    ingredient.onclick = function () {
                        this.remove();
                    }
                    preivew.appendChild(ingredient);

                } else {
                    alert("재료를 입력해주세요!");
                }
            } else {
                alert("재료는 10개까지 입력 가능합니다.");
            }
        }

    </script>
    <style>
        input[type="button"] {
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            background-color: #4CAF50;

            /* Add some hover effects */
            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
            -o-transition: all 0.5s;
            -ms-transition: all 0.5s;
        }

        input[type="button"]:hover {
            background-color: #3e8e41;
        }

        input[type="button"]:active {
            transform: translateY(4px);
        }

        #account {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: nowrap;
            flex-direction: row-reverse;
        }

        #account > a {
            margin: 10px;
        }
    </style>
</head>
<body>
<%
%>
<%
    if (session.getAttribute("username") != null) {
%>
<div id="account">
    <input type="button" onclick="location.href='preview_page.jsp'" class="logout" value="마이페이지">
    <form action="logoutSession" method="post">
        <input style="background:red" type="button" class="logout" value="로그아웃">
    </form>
</div>
<%} else {%>

<div id="account">
    <a class="register" href="register_view.jsp">회원가입</a>
    <a class="login" href="login_view.jsp">로그인</a>
</div>
<%
    }
%>
<h1 class="title">거꾸로 레시피</h1>
<div id="main_wrap">

    <div class="add_ingredient_input_div">
        <input id="add_ingredient_input" type="text" placeholder="재료를 입력하세요">
        <input id="add_ingredient_button" type="button" onclick='add_ingredient()' value="+">
    </div>
    <form action="recipe_list.jsp">
        <div id="add_ingredient_preview_div">

        </div>
        <input class="viewer_btn" type="submit" value="조합된 레시피 보러가기"/>
    </form>
</div>
</body>
</html>