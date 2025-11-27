<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%@ page import="jjsspp.amu.bean.DonorVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 1. DAO를 통해 DB에서 리스트 가져오기 (자바 코드 영역)
    DonorDAO dao = new DonorDAO();
    List<DonorVO> list = dao.getDonorList();
%>

<jsp:include page="header.jsp" />

<h2 class="mb-4">📋 지원자 명단 현황</h2>

<table class="table table-dark table-hover table-bordered border-secondary">
    <thead>
    <tr class="text-center">
        <th>NO</th><th>이름</th><th>기증 장기</th><th>혈액형</th><th>등록일</th><th>관리</th>
    </tr>
    </thead>
    <tbody>
    <%
        // 2. 자바 for문으로 반복 출력하기
        // list가 비어있지 않으면 루프를 돕니다.
        if (list != null && list.size() > 0) {
            for (DonorVO u : list) {
    %>
    <tr class="text-center align-middle">
        <td><%= u.getSid() %></td>
        <td><a href="view.jsp?sid=<%= u.getSid() %>" class="fw-bold"><%= u.getName() %></a></td>
        <td><%= u.getOrgan() %></td>
        <td><%= u.getBlood_type() %></td>
        <td><%= u.getRegdate() %></td>
        <td>
            <button class="btn btn-sm btn-outline-warning" onclick="location.href='edit.jsp?sid=<%= u.getSid() %>'">수정</button>
            <button class="btn btn-sm btn-outline-danger" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='delete_ok.jsp?sid=<%= u.getSid() %>'">삭제</button>
        </td>
    </tr>
    <%
        } // for문 끝
    } else { // 데이터가 없을 경우
    %>
    <tr>
        <td colspan="6" class="text-center">등록된 지원자가 없습니다.</td>
    </tr>
    <%
        } // if-else 끝
    %>
    </tbody>
</table>

<div class="text-end mt-3">
    <a href="form.html" class="btn btn-lg btn-secondary">✍ 지원서 작성하기</a>
</div>

<jsp:include page="footer.jsp" />