<%@ page import="java.util.Arrays" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
            margin: 10px;
            border: solid 1px;
        }
        .recipe:hover{
            cursor: pointer;
            background: rgba(0, 0, 0, 0.06);
        }

        .ok {
            color: green;
            text-decoration-line: line-through;
        }

        .no {
            color: red;
        }

        .recipe_ingredient {
            margin: 30px;
            width: 800px;
        }

        .recipe_data {
            margin: 0 30px 0 30px;

        }

        body {
            width: 80%;
            margin: 0 auto;
        }

        .recipe_name {
            width: 300px;
            font-size: 35px;
            font-weight: bold;

        }

        .recipe_favorite {
            font-size: 100px;
            margin: 0 60px 0 0;
        }
            
    </style>
    <h1 id="title">거꾸로 레시피</h1>
</head>
<body>

<%! String result = "";
    JSONArray jsonarry;
    JSONObject jsonObject2;

%>
<article class="output">

    <%

        // 인증키 : 93015fe6a0fa49d9a7da
// 요청주소 : http://openapi.foodsafetykorea.go.kr/api/keyId/serviceId/dataType/startIdx/endIdx
// 샘플 : http://openapi.foodsafetykorea.go.kr/api/sample/COOKRCP01/xml/1/5

// URL 설명
// 추가요청인자가 없을 경우 : http://openapi.foodsafetykorea.go.kr/api/인증키/서비스명/요청파일타입/요청시작위치/요청종료위치
// 추가요청인자가 있을 경우 : http://openapi.foodsafetykorea.go.kr/api/인증키/서비스명/요청파일타입/요청시작위치/요청종료위치/변수명=값&변수명=값2
// 예 : http://openapi.foodsafetykorea.go.kr/api/sample/COOKRCP01/xml/1/5/RCP_NM=값 &RCP_PARTS_DTLS=값 &CHNG_DT=값

// 요청 인자
// [번호] [변수명]           [타입]           [변수설명]                 [값 설명]
//   1    keyId           STRING[필수]      인증키              OpenAPI에서 발급된 인증키
//   2    serviceId       STRING[필수]      서비스명            요청대상인 해당 서비스명
//   3    dataType        STRING[필수]      요청파일 타입        xml: xml파일, json: json파일
//   4    startIdx        STRING[필수]      요청시작위치         정수입력
//   5    endIdx          STRING[필수]      요청종료위치         정수입력
//   6    RCP_NM          STRING[선택]      메뉴명              추가파라미터
//   7    RCP_PARTS_DTLS  STRING[선택]      재료정보            추가파라미터
//   8    CHNG_DT         STRING[선택]      변경일자(YYYYMMDD)  변경일자 기준 이후 자료를 출력한다, 정수입력 : 20170101 (2017년 1월1일 )

        request.setCharacterEncoding("utf-8");
        System.out.println("test");
        String[] ingredients = request.getParameterValues("ingredient");
        System.out.println(Arrays.toString(ingredients));
        for (String ingredient : ingredients) {
            System.out.println(ingredient);
        }
        final String key = "93015fe6a0fa49d9a7da";
        final String serviceId = "COOKRCP01";
        final String dataType = "json";
        final String startIdx = "1";
        final String endIdx = "10";
        final String RCP_NM = ""; // 메뉴이름
        final String[] RCP_PARTS_DTLS = request.getParameterValues("ingredient");

        try {
            StringBuilder url_add = new StringBuilder();
            // 재료정보
            for (String ing : RCP_PARTS_DTLS) {
                url_add.append("RCP_PARTS_DTLS=").append(ing);
                url_add.append("&");
            }
            URL url = new URL("http://openapi.foodsafetykorea.go.kr/api/" + key + "/" + serviceId + "/" + dataType + "/" + startIdx + "/" + endIdx + "/"+ url_add);
            System.out.println(url);
            // http://openapi.foodsafetykorea.go.kr/api/93015fe6a0fa49d9a7da/COOKRCP01/json/1/10
            BufferedReader bf;
            bf = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
            result = bf.readLine();
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
            JSONObject coocks = (JSONObject) jsonObject.get("COOKRCP01");
            jsonarry = (JSONArray) coocks.get("row");
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Object o : jsonarry) {
            int ok_cnt = 0;
            int no_cnt = 0;
            jsonObject2 = new JSONObject((Map) o);
    %>

    <div class="recipe">
        <img class="recipe_img" src=<%=jsonObject2.get("ATT_FILE_NO_MK")%>>
        <div class="recipe_data">
            <p class="recipe_name"><%= jsonObject2.get("RCP_NM")%>
            </p>
        </div>
        <div class="recipe_ingredient">
            <p>재료 :
                <%
                    String strs = jsonObject2.get("RCP_PARTS_DTLS").toString().replace("\n",",");
                    for (String s : strs.split(",")) {
                %>
                <%
                    int chk = 0;
                    for (String sd : RCP_PARTS_DTLS) {
                        if (s.contains(sd)) {
                            chk = 1;
                            break;
                        }
                    }
                %>

                <% if (chk == 1) {
                    System.out.println("있음! : " + s);
                    ok_cnt += 1;
                %>

                <span class="ok"><%=s%></span>,
                <%
                } else if(!s.isEmpty()){
                    System.out.println("없음! : " + s);
                    no_cnt += 1;
                %>
                <span class="no"><%=s%></span>,

                <%
                        }
                    }
                %>
            </p>

            <p>재료 <%=ok_cnt%>/<%=ok_cnt + no_cnt%> 개 보유중</p>
            <span class="recipe_cook_type">조리방법 : <%=jsonObject2.get("RCP_WAY2")%></span>
        </div>
        <span class="recipe_favorite">☆</span>
    </div>

    <%
        }

    %>
</article>
</body>
</html>
