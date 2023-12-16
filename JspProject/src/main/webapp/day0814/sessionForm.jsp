<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
 <%
 	session.setAttribute("msg", "happy");
 	session.setMaxInactiveInterval(10);
 %>
 <h2>10초안에 눌러주세요!!!</h2>
 <form action="sessionAction.jsp" method="post">
 	<h2>가고싶은 여행지</h2>
 	<input type="radio" value="베트남 3박4일" name="travel" checked="checked">베트남 3박4일&nbsp;
 	<input type="radio" value="캐나다 3박4일" name="travel">캐나다 3박4일&nbsp;
 	<input type="radio" value="태국 3박4일" name="travel">태국 3박4일&nbsp;
 	<input type="radio" value="일본 3박4일" name="travel">일본 3박4일&nbsp;
 	<input type="radio" value="홍콩 3박4일" name="travel">홍콩 3박4일&nbsp;<br>
 	<input value="여행당첨" type="submit">
 </form>
</body>
</html>