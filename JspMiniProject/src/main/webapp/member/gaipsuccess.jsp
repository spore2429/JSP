<%@page import="data.dao.MemberDao"%>
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
  	String id=request.getParameter("id");
  	MemberDao dao=new MemberDao();
  	//아이디에 대한 이름얻기
  	String name=dao.getName(id);
  %>
  <div style="margin: 200px 200px;">
  	<img alt="" src="image/2.gif" width="310px" height="200px"><br>
  	<b style="color: blue;"><%=name %></b><b>님의 회원가입을 축하드립니다!!!</b>
  	<br><br>
  	<button type="button" class="btn btn-info"
  	onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
  	<button type="button" class="btn btn-info"
  	onclick="location.href='index.jsp'">홈</button>
  </div>
</body>
</html>