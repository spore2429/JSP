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
<%
	String num=request.getParameter("num");
%>
<body>
<form action="deleteAction.jsp">
<table class="">
	<tr>
	<b>삭제를 원하시면 비밀번호를 입력하세요.</b><br><br>

	<th>비밀번호:&nbsp;</th>
	<td>
	<input type="hidden" name="num" value="<%=num %>" >
	<input type="password" name="pass" style="width: 60px">
	<input type="submit" value="입력">
	<input type="button" onclick="location.href='guestList.jsp'" value="취소">
	</td>
	</tr>
</table>
</form>
</body>
</html>