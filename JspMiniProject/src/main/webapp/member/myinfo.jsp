<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
	$(function(){
		
		$(".btndelete").click(function() {
			
			var num=$(this).attr("num");
			alert(num);
			
			var ans=confirm("정말 탈퇴하시겠습니까?");
			
			if(ans){
				
				location.href="member/deleteme.jsp?num"+num;
			}
			
		})
	})
</script>
</head>
<%
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
/* 로그인한 본이꺼만 수정/삭제 보이도록....*/
String loginok=(String)session.getAttribute("loginok");
String id=(String)session.getAttribute("myid");

%>
<body>
<table class="table tbale-bordered" style="width: 600px;">
<%
for(MemberDto dto:list)
{%>
<% 

//로그인한 본인꺼만 나오도록
if(loginok!=null && dto.getId().equals(id))
{%>
	<tr>
	  <td rowspan="7">
	  	<img alt="" src="image/2.png" style="width: 150px; border-radius: 30px;">
	  </td>
	</tr>
	<tr>
	  <td>이름: <%=dto.getName() %></td>
	</tr>
	<tr>
	  <td>아이디: <%=dto.getId() %></td>
	</tr>
	<tr>
	  <td>핸드폰: <%=dto.getHp() %></td>
	</tr>
	<tr>
	  <td>주소: <%=dto.getAddr() %></td>
	</tr>
	<tr>
	  <td>이메일: <%=dto.getEmail() %></td>
	</tr>
	<tr>
	  <td>가입일: <%=sdf.format(dto.getGaipday()) %></td>
	</tr>
	<tr>
	<td align="center" colspan="2">
	  	<button type="button" class="btn btn-outline-danger btn-sm"
	  	onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">회원정보수정</button>
	  	<button type="button" class="btn btn-outline-info btn-sm btndelete" num="<%=dto.getNum()%>">회원탈퇴</button>
	 </td>
	 </tr> 
<%}
}
%>
 		
</table>
</body>
</html>