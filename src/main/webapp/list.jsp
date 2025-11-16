<%--
  Created by IntelliJ IDEA.
  User: kimjunhyoung
  Date: 25. 11. 17.
  Time: 오전 7:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  List<Map<String, String>> applicantList = new ArrayList<>();

  Map<String, String> app1 = new HashMap<>();
  app1.put("id", "1");
  app1.put("name", "김준형");
  app1.put("organ", "신장");
  app1.put("contact", "010-1234-5678");
  app1.put("date", "2025-11-20");
  app1.put("age", "24");
  app1.put("health", "매우 건강함");
  applicantList.add(app1);

  Map<String, String> app2 = new HashMap<>();
  app2.put("id", "2");
  app2.put("name", "최재민");
  app2.put("organ", "간");
  app2.put("contact", "010-9876-5432");
  app2.put("date", "2025-11-22");
  app2.put("age", "30");
  app2.put("health", "약간의 지방간");
  applicantList.add(app2);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>지원자 목록 (Mock Data)</title>
  <style>
    body { font-family: sans-serif; margin: 20px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
    .btn { padding: 5px 10px; background-color: #007bff; color: white; text-decoration: none; border-radius: 4px; }
    .btn-edit { background-color: #28a745; }
    .btn-delete { background-color: #dc3545; }
    .btn-container { margin-top: 15px; text-align: right; }
  </style>
</head>
<body>
<h1>장기 기증 지원자 목록 (Frontend Mock)</h1>

<table>
  <thead>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>희망 장기</th>
    <th>연락처</th>
    <th>희망 날짜</th>
    <th>관리</th>
  </tr>
  </thead>
  <tbody>
  <% for (Map<String, String> app : applicantList) { %>
  <tr>
    <td><%= app.get("id") %></td>

    <td>
      <a href="view.jsp?id=<%= app.get("id") %>"><%= app.get("name") %></a>
    </td>

    <td><%= app.get("organ") %></td>
    <td><%= app.get("contact") %></td>
    <td><%= app.get("date") %></td>
    <td>
      <a href="edit.jsp?id=<%= app.get("id") %>" class="btn btn-edit">Edit</a>
      <a href="delete_ok.jsp?id=<%= app.get("id") %>" class="btn btn-delete">Delete</a>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

<div class="btn-container">
  <a href="form.html" class="btn">Add New Applicant</a>
</div>

</body>
</html>