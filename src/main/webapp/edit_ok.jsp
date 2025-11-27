<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="vo" class="jjsspp.amu.bean.DonorVO" />
<jsp:setProperty property="*" name="vo" />

<%
  DonorDAO dao = new DonorDAO();
  // 수정 실행
  int result = dao.updateDonor(vo);

  if (result > 0) {
    // 성공 시 목록으로 이동
    response.sendRedirect("list.jsp");
  } else {
%>
<script>
  alert("수정에 실패했습니다!");
  history.back();
</script>
<%
  }
%>