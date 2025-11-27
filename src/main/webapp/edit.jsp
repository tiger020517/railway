<%@ page import="jjsspp.amu.dao.DonorDAO" %>
<%@ page import="jjsspp.amu.bean.DonorVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  String sidStr = request.getParameter("sid");
  int sid = Integer.parseInt(sidStr);
  DonorDAO dao = new DonorDAO();
  DonorVO u = dao.getDonor(sid);
%>

<jsp:include page="header.jsp" />

<div class="container" style="max-width: 600px;">
  <h2 class="mb-4">🛠 정보 수정</h2>

  <form action="edit_ok.jsp" method="post" class="bg-dark p-4 border border-secondary rounded">
    <input type="hidden" name="sid" value="<%= u.getSid() %>">

    <div class="mb-3">
      <label class="text-light">이름</label>
      <input type="text" name="name" class="form-control bg-secondary text-light border-0" value="<%= u.getName() %>" required>
    </div>
    <div class="mb-3">
      <label class="text-light">나이</label>
      <input type="number" name="age" class="form-control bg-secondary text-light border-0" value="<%= u.getAge() %>" required>
    </div>
    <div class="mb-3">
      <label class="text-light">연락처</label>
      <input type="text" name="contact" class="form-control bg-secondary text-light border-0" value="<%= u.getContact() %>" required>
    </div>

    <div class="mb-3">
      <label class="text-light">신체정보 (키/몸무게)</label>
      <div class="d-flex gap-2">
        <input type="number" name="height" class="form-control bg-secondary text-light border-0" value="<%= u.getHeight() %>" placeholder="키">
        <input type="number" name="weight" class="form-control bg-secondary text-light border-0" value="<%= u.getWeight() %>" placeholder="몸무게">
      </div>
    </div>

    <div class="mb-3">
      <label class="text-light d-block">혈액형</label>
      <input type="radio" name="blood_type" value="A" <%= "A".equals(u.getBlood_type()) ? "checked" : "" %>> <span class="text-light me-3">A</span>
      <input type="radio" name="blood_type" value="B" <%= "B".equals(u.getBlood_type()) ? "checked" : "" %>> <span class="text-light me-3">B</span>
      <input type="radio" name="blood_type" value="AB" <%= "AB".equals(u.getBlood_type()) ? "checked" : "" %>> <span class="text-light me-3">AB</span>
      <input type="radio" name="blood_type" value="O" <%= "O".equals(u.getBlood_type()) ? "checked" : "" %>> <span class="text-light me-3">O</span>
    </div>

    <div class="mb-3">
      <label class="text-light">흡연여부: </label>
      <input type="radio" name="smoker" value="yes" <%= "yes".equals(u.getSmoker()) ? "checked" : "" %>> <span class="text-light me-2">예</span>
      <input type="radio" name="smoker" value="no" <%= "no".equals(u.getSmoker()) || u.getSmoker() == null ? "checked" : "" %>> <span class="text-light">아니오</span>
    </div>

    <div class="mb-3">
      <label class="text-light">기증 장기</label>
      <select name="organ" class="form-select bg-secondary text-light border-0">
        <option value="신장" <%= "신장".equals(u.getOrgan()) ? "selected" : "" %>>신장</option>
        <option value="간" <%= "간".equals(u.getOrgan()) ? "selected" : "" %>>간</option>
        <option value="심장" <%= "심장".equals(u.getOrgan()) ? "selected" : "" %>>심장</option>
        <option value="폐" <%= "폐".equals(u.getOrgan()) ? "selected" : "" %>>폐</option>
        <option value="췌장" <%= "췌장".equals(u.getOrgan()) ? "selected" : "" %>>췌장</option>
        <option value="각막" <%= "각막".equals(u.getOrgan()) ? "selected" : "" %>>각막</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="text-light">건강상태</label>
      <textarea name="health" class="form-control bg-secondary text-light border-0" rows="3"><%= u.getHealth() %></textarea>
    </div>

    <button type="submit" class="btn btn-warning w-100 btn-lg">수정 완료</button>
  </form>
  <div class="text-center mt-3">
    <a href="list.jsp" class="text-light">취소하고 목록으로</a>
  </div>
</div>

<jsp:include page="footer.jsp" />