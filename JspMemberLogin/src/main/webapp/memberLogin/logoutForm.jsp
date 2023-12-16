<%@page import="member.model.MemberDao"%>
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
	//세션으로 부터 idok
	String id=(String)session.getAttribute("idok");

	
	//아이디에 해당하는 이름을 dao로 부터얻는다
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
%>

<br><br>
<b style="color: blue;"><%=name %></b>님 환영합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="로그아웃" class="btn btn-danger"
onclick="location.href='logoutAction.jsp'">

<input type="button" value="회원목록" class="btn btn-success"
onclick="location.href='../member/memberList.jsp'">
<br><br>
<img alt="" src="../이미지/avata/b4.png" width="300px">
</body>
</html>