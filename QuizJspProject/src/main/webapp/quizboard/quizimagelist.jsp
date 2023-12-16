<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>

</head>
<% 
	QuizBoardDao dao=new QuizBoardDao();
	List<QuizBoardDto> list=dao.getAllBoards();
%>
<body>
	<div style="margin: 30px 30px; width: 800px;">
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='quizform.jsp'"><b><i class="bi bi-pencil"></i>글쓰기</b></button>
		<button type="button" class="btn btn-outline-info"
		onclick="location.href='quizlist.jsp'"><b><i class="bi bi-list-ul"></i>목록</b></button>
	</div>
	
	<br>
	<table class="table table-bordered" style="width: 600px; text-align: center;" >
		<caption><h6>이미지게시판</h6></caption>
		<tr>
			<th width="60" >번호</th>
			<th width="60" >제목</th>
			<th width="80">작성자</th>
			<th width="80">작성일</th>
			<th width="60" >조회</th>
			<th width="60">이미지</th>
		</tr>
		
		<%
		if(list.size()==0)
		{%>
			<tr>
				<td colspan="5" align="center">
					<h6><b>등록된 게시물이 없습니다</b></h6>
				</td>
			</tr>
		<%}else{
			
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			 
			 for(int i=0;i<list.size();i++)
			 {
				 QuizBoardDto dto=list.get(i);
				 %>
				 <tr>
				 	<td align="center" valign="middle"><%=dto.getQ_num() %></td>
				 	<td align="center" valign="middle"><%=dto.getTitle() %></td>
				 	<td align="center" valign="middle"><%=dto.getWriter() %></td>
				 	<td align="center" valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
				 	<td align="center" valign="middle"><%=dto.getReadcount()%></td>
				 	<td align="center" valign="middle"><img src="<%=dto.getImgname()%>" width="100px"></td>
				 </tr> 	 
			 <%}
		}
		%>
	</table>
	
</body>
</html>