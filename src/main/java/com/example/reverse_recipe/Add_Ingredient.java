package com.example.reverse_recipe;


import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;

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

@WebServlet(name = "add_ingredent", value = "/add_ingredent")
public class Add_Ingredient extends HttpServlet {
    String result;
    JSONArray jsonarry;
    public void init() {
        System.out.println("test");
        final String key = "93015fe6a0fa49d9a7da";
        final String serviceId = "COOKRCP01";
        final String dataType = "json";
        final String startIdx = "1";
        final String endIdx = "20";
        try {
            URL url = new URL("http://openapi.foodsafetykorea.go.kr/api/" + key + "/" + serviceId + "/" + dataType + "/" + startIdx + "/" + endIdx);
            // http://openapi.foodsafetykorea.go.kr/api/93015fe6a0fa49d9a7da/COOKRCP01/json/1/10
            BufferedReader bf;
            bf = new BufferedReader(new InputStreamReader(url.openStream(), StandardCharsets.UTF_8));
            result = bf.readLine();
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONObject coocks = (JSONObject)jsonObject.get("COOKRCP01");
            jsonarry = (JSONArray)coocks.get("row");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("된당");
        JSONParser jsonParser = new JSONParser();
        PrintWriter out = response.getWriter();
        for (Object o : jsonarry) {
            JSONObject jsonObject = new JSONObject((Map) o);
            out.println("메뉴 이름 : " + jsonObject.get("RCP_NM"));
            out.println("<br>");
            out.println("재료 : " + jsonObject.get("RCP_PARTS_DTLS"));
            out.println("<br>");
            out.println("조리방법 : " + jsonObject.get("RCP_WAY2"));
            out.println("요리 이미지 : <img src='"+jsonObject.get("ATT_FILE_NO_MK")+"'/>");
            out.println("<hr><br>");
        }

    }

    public void destroy() {
    }
}