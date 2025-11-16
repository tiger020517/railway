<%--
  Created by IntelliJ IDEA.
  User: kimjunhyoung
  Date: 25. 11. 17.
  Time: 오전 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String contact = request.getParameter("contact");
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
    String bloodType = request.getParameter("blood_type");
    String organ = request.getParameter("organ");
    String health = request.getParameter("health");
    String date = request.getParameter("date");

    String smoker = request.getParameter("smoker");
    String isSmoker = "아니오";
    if (smoker != null && smoker.equals("yes")) {
        isSmoker = "예";
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>지원서 수정 완료</title>
    <style>
        body {
            font-family: 'RoundedFixedsys', monospace;
            background-color: #0a0a0a;
            color: #d4d4d4;
            padding: 20px;
        }
        .container {
            background-color: #1c1c1c;
            padding: 30px;
            border: 2px solid #555;
            max-width: 600px;
            margin: auto;
        }
        h1 { color: #e0e0e0; }
        p { font-size: 1.2em; line-height: 1.6; }
        span { color: #75fa69; font-weight: bold; }
    </style>
</head>
<body>
<div class="container">
    <h1>감사합니다. 지원서가 성공적으로 접수되었습니다.</h1>
    <p>곧 연락 드리겠습니다.</p>
    <hr>

    <h2>접수된 지원자 정보</h2>

    <p>이름: <span><%= name %></span></p>
    <p>나이: <span><%= age %></span></p>
    <p>연락처: <span><%= contact %></span></p>
    <p>키/몸무게: <span><%= height %> cm / <%= weight %> kg</span></p>
    <p>혈액형: <span><%= bloodType %></span> 형</p>
    <p>기증 희망 장기: <span><%= organ %></span></p>
    <p>흡연 여부: <span><%= isSmoker %></span></p>
    <p>건강 상태: <span><%= health %></span></p>
    <p>희망 날짜: <span><%= date %></span></p>

    <br>
    <a href="form.html">돌아가기</a>
</div>
</body>
</html>