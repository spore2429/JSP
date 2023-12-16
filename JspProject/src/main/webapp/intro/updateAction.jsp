<%@page import="model.intro.IntroDao"%>
<%@page import="model.intro.IntroDto"%>
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
	//한글엔코딩
	request.setCharacterEncoding("UTF-8");

	String intro_num=request.getParameter("intro_num");
	String name=request.getParameter("name");
	String blood=request.getParameter("blood");
	String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3");
	String city=request.getParameter("city");
	
	IntroDto dto=new IntroDto();
	
	dto.setIntro_num(intro_num);
	dto.setIntro_name(name);
	dto.setIntro_blood(blood);
	dto.setIntro_hp(hp1+"-"+hp2+"-"+hp3);
	dto.setIntro_city(city);
	
	IntroDao dao=new IntroDao();
	dao.updateIntro(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>