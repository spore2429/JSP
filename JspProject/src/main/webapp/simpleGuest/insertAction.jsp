<%@page import="db.simpleguest.SimpleGuestDao"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
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
<%-- <%
	//한글깨짐방지
	 request.setCharacterEncoding("utf-8");	

	String image=request.getParameter("image");
	String nick=request.getParameter("nick");
	String pass=request.getParameter("pass");
	String story=request.getParameter("story");
	
	SimpleGuestDto dto=new SimpleGuestDto();
	dto.setImage(image);
	dto.setNick(nick);
	dto.setPass(pass);
	dto.setStory(story);
	
	SimpleGuestDao dao=new SimpleGuestDao();
	dao.insertSimpleGuest(dto);
	
	response.sendRedirect("guestList.jsp"); 
	
%> --%>

	<!-- 자바빈즈로 변경하려면? -->
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<jsp:useBean id="dao" class="db.simpleguest.SimpleGuestDao"/>
	<jsp:useBean id="dto" class="db.simpleguest.SimpleGuestDto"/>
	
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	
	//db에 insert
	dao.insertSimpleGuest(dto);
	
	//목록으로이동
	response.sendRedirect("guestList.jsp"); 
	%>
</body>
</html>