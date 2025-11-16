<%--
  Created by IntelliJ IDEA.
  User: kimjunhyoung
  Date: 25. 11. 13.
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h1>당신의 헌신에 감사합니다</h1>
<form id="myForm" action="form_ok.jsp" method="post">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="organ">기증할 장기:</label>
    <select id="organ" name="organ" required>
    </select><br><br>

    <label for="health">건강 상태:</label><br>
    <textarea id="health" name="health" rows="4" cols="50" placeholder="건강 상태에 대해 간단히 설명해주세요." required></textarea><br><br>

    <label for="date">희망 기증 날짜:</label>
    <input type="date" id="date" name="date" required><br><br>

    <input type="submit" value="제출">
</form>

<script>
    const myForm = document.getElementById('myForm');
    myForm.addEventListener('submit', function(event) {

        const ageInput = document.getElementById('age');

        if (ageInput.value < 19) {
            alert('아직 덜 자랐네, 어머니 모시고 오렴');
            event.preventDefault();
            ageInput.focus();
            return ;
        }

        if (ageInput.value > 60) {
            alert('유통기한 지났습니다.');
            event.preventDefault();
            ageInput.focus();
            return ;
        }
    });
</script>
</body>
</html></html>
