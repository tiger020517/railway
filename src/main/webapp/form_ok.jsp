<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="vo" class="jjsspp.amu.bean.DonorVO" />
<jsp:setProperty property="*" name="vo" />

<%
  // 2. DAO를 통해 DB에 저장
  DonorDAO dao = new DonorDAO();
  int result = dao.insertDonor(vo);

  if (result > 0) {
    response.sendRedirect("list.jsp");
  } else {
%>
<script>
  alert("지원서 등록에 실패했습니다!");
  history.back();
</script>
<%
  }
%>