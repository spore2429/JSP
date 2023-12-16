<%@page import="model.intro.IntroDto"%>
<%@page import="model.intro.IntroDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<style>
	

</style>
</head>

<%
	String intro_num=request.getParameter("intro_num");
	IntroDao dao=new IntroDao();
	IntroDto dto=dao.getData(intro_num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<input type="hidden" name="num" value="<%=intro_num %>">
	<table class="table table-bordered" style="width: 400px" border="none" >

	
	<tr>
	<td colspan="2" align="center">
		<b>[<%=dto.getIntro_name() %>님의 자기소개]</b>
	</td>
	</tr>

	<tr>
		<th>이름</th>
		<td><%=dto.getIntro_name() %></td>
	</tr>

	<tr>
		<th>혈액형</th>
		<td><%=dto.getIntro_blood() %></td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td><%=dto.getIntro_hp() %></td>
	</tr>
	
	<tr>
		<th>거주지</th>
		<td><%=dto.getIntro_city() %></td>
	</tr>
	
	<tr>
		<th>등록일</th>
		<td><%=sdf.format(dto.getGaipday()) %></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<button type="button" class="btn btn-success"
		onclick="location.href='list.jsp'">목록으로이동</button>
		</td>
	</tr>
	</table>
<div id="result"></div>

</body>
</html>