<%@page import="db.quiz.QuizBoardDto"%>
<%@page import="db.quiz.QuizBoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String realPath=getServletContext().getRealPath("/upload");
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi=null;
	
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
			new DefaultFileRenamePolicy());
	
	//dao선언
	QuizBoardDao dao=new QuizBoardDao();
	//dto
	QuizBoardDto dto=new QuizBoardDto();
	
	dto.setWriter(multi.getParameter("writer"));
	dto.setTitle(multi.getParameter("title"));
	dto.setContent(multi.getParameter("content"));
	
	//dto.setImage(multi.getFilesystemName("uploadImage"));
	String photo=multi.getFilesystemName("imgname");
	
	if(photo==null)
		dto.setImgname("../이미지/Other_img/noimg.jpg"); //사진선택안한경우
	else
		dto.setImgname("../upload/"+photo); //사진선택한경우
		
	
	//db에 insert
	dao.insertBoard(dto);
	
	//성공후 이동
	response.sendRedirect("quizlist.jsp");
%>
</body>
</html>