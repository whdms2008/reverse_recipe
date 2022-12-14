package com.example.reverse_recipe;

import java.io.*;
import java.net.URL;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

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

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class Add_Ingredient extends HttpServlet {
    private String[] ingredient;
    private final String key = "93015fe6a0fa49d9a7da";
    private final String url = "http://openapi.foodsafetykorea.go.kr/api/keyId/serviceId/dataType/startIdx/endIdx";
    public void init() {
        try{
            URL url = new URL("http://openapi.foodsafetykorea.go.kr/api/"+key+"/");
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {


    }

    public void destroy() {
    }
}