<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%@ page import="jjsspp.amu.bean.DonorVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  // 1. 파라미터로 넘어온 게시물 번호(sid) 받기
  String sidStr = request.getParameter("sid");
  int sid = Integer.parseInt(sidStr);

  // 2. DB에서 상세 정보 조회
  DonorDAO dao = new DonorDAO();
  DonorVO u = dao.getDonor(sid);
%>

<jsp:include page="header.jsp" />

<div class="container" style="max-width: 600px;">
  <h2 class="mb-4 text-danger">🔍 지원자 상세 정보</h2>

  <div class="card bg-dark text-light border-secondary">
    <div class="card-body">
      <p class="fs-5 border-bottom border-secondary pb-2">이름: <span class="text-success float-end"><%= u.getName() %></span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">나이: <span class="text-success float-end"><%= u.getAge() %>세</span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">연락처: <span class="text-success float-end"><%= u.getContact() %></span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">신체정보: <span class="text-success float-end"><%= u.getHeight() %>cm / <%= u.getWeight() %>kg</span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">혈액형: <span class="text-success float-end"><%= u.getBlood_type() %>형</span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">흡연여부: <span class="text-success float-end"><%= u.getSmoker() %></span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">기증 장기: <span class="text-warning float-end"><%= u.getOrgan() %></span></p>
      <p class="fs-5 border-bottom border-secondary pb-2">건강상태: <span class="text-light float-end"><%= u.getHealth() %></span></p>
      <p class="fs-5 pb-2">등록일: <span class="text-secondary float-end"><%= u.getRegdate() %></span></p>
    </div>
  </div>

  <div class="text-center mt-4">
    <a href="list.jsp" class="btn btn-secondary mx-2">목록으로</a>
    <a href="edit.jsp?sid=<%= u.getSid() %>" class="btn btn-warning mx-2">정보 수정</a>
    <a href="delete_ok.jsp?sid=<%= u.getSid() %>" class="btn btn-danger mx-2" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
  </div>
</div>

<jsp:include page="footer.jsp" />