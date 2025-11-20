<%--
  Created by IntelliJ IDEA.
  User: kimjunhyoung
  Date: 25. 11. 17.
  Time: 오전 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.Repository" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    Repository.update(request.getParameter("id"), request.getParameter("name"), request.getParameter("organ"), request.getParameter("contact"));
    response.sendRedirect("list.jsp");
%>