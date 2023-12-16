<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.quiz.QuizBoardDto"%>
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
<style type="text/css">
	span.day{
		color: #ccc; 
		font-size: 20px;
			
		}
	
	
</style>
</head>
<body>
<jsp:useBean id="dao" class="db.quiz.QuizBoardDao"/>
<%
	//num을 읽는다
	String num=request.getParameter("num");

	//dao선언
	//조회수 1증가
	dao.updateReadCount(num);
	
	
	QuizBoardDto dto=dao.getBoard(num);
	
	//날짜형식
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

	<div style="margin: 30px 30px;">
	<table class="table table-bordered">
		<caption align="top"><b>제목: <%=dto.getTitle() %></b></caption>
		<tr>
		<td>
		<b>작성자: <%=dto.getWriter() %></b><br>
		<span class="day"><%=sdf.format(dto.getWriteday()) %>
		&nbsp;&nbsp;&nbsp;조회: <%=dto.getReadcount() %></span>
		</td>
		</tr>

		<tr height="150">
		<td>
		<!-- pre태그안에 쓰거나 replace()이용한다:db저장시 br태그가 \n으로 저장된다.. 그러므로 출력시 다시 br로전환 -->
			<%=dto.getContent().replace("\n", "<br>") %>
		</td>
		</tr>
		
		<tr>
		<td>
			<button type="button" class="btn btn-outline-success btn-sm"
			onclick="location.href='quizform.jsp'"><i class="bi bi-pencil"></i>글쓰기</button>
			<button type="button" class="btn btn-outline-success btn-sm"
			onclick="location.href='quizlist.jsp'"><i class="bi bi-list-task"></i>목록</button>
		</td>
		</tr>
	</table>
</div>
</body>
</html>