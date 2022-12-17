<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.example.reverse_recipe.UserDAO" %>
<% request.setCharacterEncoding("utf-8");
    JSONArray jsonarry;
    final String key = "93015fe6a0fa49d9a7da";
    final String serviceId = "COOKRCP01";
    final String dataType = "json";
    final String startIdx = "1";
    final String endIdx = "30";
    final String RCP_NM = request.getParameter("food_name"); // 메뉴이름
    String result = "";
    URL url;
    url = new URL("http://openapi.foodsafetykorea.go.kr/api/" + key + "/" + serviceId + "/" + dataType + "/" + startIdx + "/" + endIdx + "/" + "RCP_NM=" + RCP_NM);
    // http://openapi.foodsafetykorea.go.kr/api/93015fe6a0fa49d9a7da/COOKRCP01/json/1/100/RCP_NM=나가사키부대찌개
    BufferedReader bf;
    bf = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
    result = bf.readLine();
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject;
    try {
        jsonObject = (JSONObject) jsonParser.parse(result);
    } catch (ParseException e) {
        System.out.println(result);
        throw new RuntimeException(e);
    }
    JSONObject coocks = (JSONObject) jsonObject.get("COOKRCP01");
    jsonarry = (JSONArray) coocks.get("row");
    JSONObject rows = (JSONObject) jsonarry.get(0);
%>

<%--<%--%>
<%--    UserDAO dao = new UserDAO();--%>
<%--    String session_name = (String) session.getAttribute("username");--%>
<%--    System.out.println(session_name + " , " + session.getAttribute("username"));--%>
<%--    System.out.println(dao.favorite(request.getParameter("food_name"), session_name));--%>


<%--%>--%>
<html>
<head>
    <title>Title</title>
    <meta>
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
            border: 5px black solid;
        }

        input {
            width: 80%;
            height: 10%;
            font-size: 20px;
        }

        textarea {
            width: 100%;
            height: 60%;
            font-size: 15px;
        }

        button {
            float: right;
            width: 200px;
            height: 50px;
        }

        .recipe_do {
            display: flex;
            align-items: center;
            margin: 10px;
        }

        body {
            width: 80%;
            margin: 0 auto;
        }

        .recipe_do_span {
            margin: 30px;
            font-size: 25px;
        }

        .recipe_name_div {

            border: solid 1px;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }

        .recipe_name {
            font-size: 35px;
            width: 50%;
            text-align: center;
        }

        .recipe_favorite_no {
            font-size: 60px;
            margin: 10px;

        }

        .recipe_favorite_yes {
            color: yellow;
            font-size: 60px;
            margin: 10px;

        }

        .recipe_img {
            min-width: 200px;
            max-width: 250px;
        }
    </style>
</head>
<body>
<h1>거꾸로 레시피</h1>


<%
    UserDAO dao = new UserDAO();

    int chk = dao.favorite_chk(request);
%>

<div class="recipe_name_div">
    <form action="favorite" method="post">
        <input name="food_name" type="text" class="recipe_name" value=<%=request.getParameter("food_name")%>>
        <% if (chk == 0) { %>
        <input type="submit" class="recipe_favorite_no" value="☆">
        <%} else if (chk == 1) { %>
        <input type="submit" class="recipe_favorite_yes" value="★">
        <%}%>
    </form>
</div>
<div>


    <%= rows.get("RCP_PARTS_DTLS")%>
    <%
        String gets;
        String get_img;
        for (int i = 1; i < 20; i++) {
            if (i < 10) {

                gets = "MANUAL0" + i;
                get_img = "MANUAL_IMG0" + i;
            } else {
                gets = "MANUAL" + i;
                get_img = "MANUAL_IMG" + i;
            }
            if (rows.get(gets).equals("")) {
                break;
            }%>
    <div class="recipe_do">
        <img class="recipe_img" src=<%=rows.get(get_img)%>>
        <span class="recipe_do_span"><%=rows.get(gets)%></span>
    </div>
    <%}%>
</div>
<div style="    display: flex;

    justify-content: center;">

    <form action="review.jsp">
        <input name="food_name" type="text" style="display: none" value=<%=request.getParameter("food_name")%>>
        <input style="    width: 200px;
    height: 50px;" type="submit" value="리뷰 남기러 가기">
    </form>
    <button onclick="history.back()">뒤로가기</button>
</div>
</body>
</html>
