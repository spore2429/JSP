<%@page import="db.simpleboard.SimpleBoardDto"%>
<%@page import="db.simpleboard.SimpleBoardDao"%>
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
	//num,pass
	String num=request.getParameter("num");
	String pass=request.getParameter("pass");
	
	SimpleBoardDao dao=new SimpleBoardDao();
	
	//passCheck호출
	boolean check= dao.getCheckPass(num, pass);
	System.out.println(check);
	
	//true면 수정폼으로,false면 경고창
	if(check)
	{
		response.sendRedirect("updateform.jsp?num="+num);
	}else{%>
	
		<script type="text/javascript">
		alert("비밀번호가 맞지않습니다");
		history.back();
		</script>
	<%}
%>
</body>
</html>