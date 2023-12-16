<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
	div.cart{
		float: right;
		cursor: pointer;
	}
	.count{
	
		width: 30px;
		height: 30px;
		float: right;
		background-color: red;
		border-radius: 100px;
		text-align: center;
		line-height:30px;
		z-index: 10;
		position: relative;
		left: -20px;
		top: 10px;
		color: white;
	}
</style>
<script type="text/javascript">
	$(function() {
		
		$("div.cart").click(function(){
			
			location.href="index.jsp?main=shop/mycart.jsp";
		})
	})
</script>
<title>Insert title here</title>
</head>
<%
	//절대경로잡기
	String root=request.getContextPath();
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
	MemberDao dao=new MemberDao();
	String name=dao.getName(myid);
	
	
%>
<body>
<a href="<%=root%>" style="color: black; text-decoration: none"><img alt="" src="<%=root%>/image/1.png" width="90px" height="50px";">
<b>JSP & JQuery Mini Project</b></a>
<%
	if(loginok!=null)
	{%>
		<button type="button" class="btn btn-danger btn-lg"
		onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
		<b style="color: blue"><%=name %></b>님이 로그인중입니다.
	<%}else{
		%>
		<button type="button" class="btn btn-success btn-lg"
		onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
	<%}
%>

<div class="cart">
  <%
    ShopDao sdao=new ShopDao();
  	//카트갯수
  	int cartSize=sdao.getCartList(myid).size();
  %>
  <i class="bi bi-cart4" style="font-size: 1.2em;"></i>
  <div class="count"><%=cartSize %></div>
</div>
</body>
</html>