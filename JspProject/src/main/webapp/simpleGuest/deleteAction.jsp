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
<%
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	SimpleGuestDao dao=new SimpleGuestDao();
	



	//비밀번호가 맞으면 삭제... = 목록으로 이동
	 
		
			if(dao.isEqualPass(num, pass))
			{	
					
					dao.deleteSimpleGuest(num);
					response.sendRedirect("guestList.jsp");
				
			}
			
		else{//틀리면 자바스크립트로 경고후 이전화면으로 이동
			%>
			
			<script type="text/javascript">
			alert("비밀번호가 맞지않습니다");
			history.back();
			</script>
			
		<%}
	%>
</body>
</html>