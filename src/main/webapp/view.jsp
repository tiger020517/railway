<%--
  Created by IntelliJ IDEA.
  User: kimjunhyoung
  Date: 25. 11. 19.
  Time: 오후 7:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.Repository" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String id = request.getParameter("id");
  Map<String, String> item = Repository.getById(id);
%>
<!DOCTYPE html>
<html>
<head>
  <title>상세 정보</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 500px;">
  <div class="card">
    <div class="card-header bg-info text-white">지원자 상세 정보</div>
    <div class="card-body">
      <h5 class="card-title"><%= item.get("name") %></h5>
      <p class="card-text">기증 장기: <%= item.get("organ") %></p>
      <p class="card-text">연락처: <%= item.get("contact") %></p>
      <p class="card-text"><small class="text-muted">등록일: <%= item.get("date") %></small></p>
    </div>
    <div class="card-footer text-end">
      <a href="list.jsp" class="btn btn-secondary">목록으로</a>
      <a href="edit.jsp?id=<%= id %>" class="btn btn-warning">수정</a>
    </div>
  </div>
</div>
</body>
</html>