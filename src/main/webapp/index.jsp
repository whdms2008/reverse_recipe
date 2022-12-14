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

                    let ingredient = document.createElement("button");
                    let preivew = document.getElementById("add_ingredient_preview_div");
                    let value = document.getElementById("add_ingredient_input");
                    ingredient.setAttribute("class", "ingredient");
                    ingredient.textContent = value.value;
                    ingredient.style.margin = "10px";
                    ingredient.style.padding = "10px";
                    value.value = "";
                    ingredient.onclick = function () {
                        this.remove();
                    }
                    preivew.appendChild(ingredient);

                }else{
                    alert("재료를 입력해주세요!");
                }
            } else {
                alert("재료는 10개까지 입력 가능합니다.");
            }
        }

    </script>
    <%--    <%! String[] ingredients = {"","","","","","","","","",""};--%>
    <%--        public void add_ingredient(String ingredient, int index){--%>
    <%--            ingredients[index] = ingredient;--%>
    <%--        };--%>

    <%--    %>--%>
</head>
<body>
<div id="account">
    <a class="register" href="">회원가입</a>
    <a class="login" href="">로그인</a>
</div>

<h1 class="title">거꾸로 레시피</h1>
<div id="main_wrap">

    <div class="add_ingredient_input_div">
        <input id="add_ingredient_input" type="text" placeholder="재료를 입력하세요">
        <input id="add_ingredient_button" type="button" onclick='add_ingredient()' value="+">
    </div>
    <div id="add_ingredient_preview_div">

    </div>
    <input class="viewer_btn" type="button" value="조합된 레시피 보러가기">

</div>
</body>
</html>