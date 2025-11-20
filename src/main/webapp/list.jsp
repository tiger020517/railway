<%@ page import="com.example.Repository" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>장기 기증 신청 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4">📋 지원자 목록</h2>
  <table class="table table-hover table-bordered">
    <thead class="table-dark">
    <tr>
      <th>#</th><th>이름</th><th>희망 장기</th><th>연락처</th><th>작성일</th><th>관리</th>
    </tr>
    </thead>
    <tbody>
    <% for(Map<String, String> item : Repository.getAll()) { %>
    <tr>
      <td><%= item.get("id") %></td>
      <td><a href="view.jsp?id=<%= item.get("id") %>" class="text-decoration-none"><%= item.get("name") %></a></td>
      <td><%= item.get("organ") %></td>
      <td><%= item.get("contact") %></td>
      <td><%= item.get("date") %></td>
      <td>
        <a href="edit.jsp?id=<%= item.get("id") %>" class="btn btn-sm btn-warning">수정</a>
        <a href="delete_ok.jsp?id=<%= item.get("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <a href="form.html" class="btn btn-primary">신규 등록</a>
</div>
</body>
</html>