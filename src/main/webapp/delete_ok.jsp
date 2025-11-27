<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%
  String sidStr = request.getParameter("sid");
  if(sidStr != null) {
    int sid = Integer.parseInt(sidStr);
    DonorDAO dao = new DonorDAO();
    dao.deleteDonor(sid);
  }
  response.sendRedirect("list.jsp");
%>