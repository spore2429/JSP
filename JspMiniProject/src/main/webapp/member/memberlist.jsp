<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

	function funcdel(num) {
		
		var yes=confirm("해당회원을 추방하시겠습니까?");
		if(yes)
		{
			location.href='member/memberdelete.jsp?num='+num;
			alert("삭제완료");
		}
	}	
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1;

	/* 로그인한 본이꺼만 수정/삭제 보이도록....*/
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("myid");
%>
<body>
<table class="table table-bordered" style="width: 1000px;">
<caption align="top">전체회원목록</caption>
<tr class="table-success" align="center">
<th style="background-color: #e6e6fa" width="60px">번호</th>
<th style="background-color: #e6e6fa" width="100px">이름</th>
<th style="background-color: #e6e6fa" width="120px">아이디</th>
<th style="background-color: #e6e6fa" width="150px">핸드폰</th>
<th style="background-color: #e6e6fa" width="350px">주소</th>
<th style="background-color: #e6e6fa" width="250px">이메일</th>
<th style="background-color: #e6e6fa" width="150px">가입일</th>
<th style="background-color: #e6e6fa" width="150px">회원관리</th>
</tr>

<%

	
for(MemberDto dto:list)	
{%>

	<tr align="center">
	  <td><%=no++ %></td>
	  <td><%=dto.getName() %></td>
	  <td><%=dto.getId() %></td>
	  <td><%=dto.getHp() %></td>
	  <td><%=dto.getAddr() %></td>
	  <td><%=dto.getEmail() %></td>
	  <td><%=sdf.format(dto.getGaipday()) %></td>
	  <td><button type="button" onclick="funcdel(<%=dto.getNum()%>)">추방</button></td>
	</tr>
<%}
%>
</table>
</body>
</html>