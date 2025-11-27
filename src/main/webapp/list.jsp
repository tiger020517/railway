<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%@ page import="jjsspp.amu.bean.DonorVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 1. 검색어 파라미터 받기
    String keyword = request.getParameter("searchKeyword");

    DonorDAO dao = new DonorDAO();
    List<DonorVO> list = null;

    // 2. 검색어가 있으면 검색 메소드, 없으면 전체 목록 메소드 호출
    if (keyword != null && !keyword.trim().isEmpty()) {
        list = dao.getDonorList(keyword);
    } else {
        list = dao.getDonorList();
    }
    // (Scriptlet 방식에서는 request.setAttribute가 굳이 필요 없지만, 습관적으로 두셔도 무방합니다)
%>

<jsp:include page="header.jsp" />

<h2 class="mb-4">📋 지원자 명단 현황</h2>

<!-- ▼▼▼ [추가된 부분] 검색창 (이게 있어야 검색이 가능합니다!) ▼▼▼ -->
<div class="row mb-3">
    <div class="col-md-6">
        <form action="list.jsp" method="get" class="d-flex gap-2">
            <input type="text" name="searchKeyword" class="form-control bg-dark text-light border-secondary" placeholder="이름으로 검색..." value="<%= (keyword != null) ? keyword : "" %>">
            <button type="submit" class="btn btn-primary">검색</button>
            <% if(keyword != null && !keyword.isEmpty()) { %>
            <a href="list.jsp" class="btn btn-secondary">전체보기</a>
            <% } %>
        </form>
    </div>
</div>
<!-- ▲▲▲ [추가 완료] ▲▲▲ -->

<table class="table table-dark table-hover table-bordered border-secondary">
    <thead>
    <tr class="text-center">
        <th>NO</th><th>이름</th><th>기증 장기</th><th>혈액형</th><th>등록일</th><th>관리</th>
    </tr>
    </thead>
    <tbody>
    <%
        // 3. 자바 for문으로 반복 출력하기
        if (list != null && list.size() > 0) {
            for (DonorVO u : list) {
    %>
    <tr class="text-center align-middle">
        <td><%= u.getSid() %></td>
        <td><a href="view.jsp?sid=<%= u.getSid() %>" class="fw-bold text-decoration-none text-light"><%= u.getName() %></a></td>
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
        <td colspan="6" class="text-center py-4">
            <% if(keyword != null) { %>
            '<%= keyword %>'에 대한 검색 결과가 없습니다.
            <% } else { %>
            등록된 지원자가 없습니다.
            <% } %>
        </td>
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