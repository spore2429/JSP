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
	String sangName=request.getParameter("sangName");
	String sangSize=request.getParameter("sangSize");
	String [] sangCol=request.getParameterValues("sangCol");
	String sangAdd=request.getParameter("sangAdd");
%>
	
	상품명: <%=sangName %><br><br>
	사이즈: <%=sangSize %><br><br>
	색상: 
	<%
		if(sangCol==null)
		{%>
			<b>선택색상없음(기본색상)</b><br><br>
		<%}else{
			
			for(int i=0;i<sangCol.length;i++)
			{%>
				
			<b style="color: <%=sangCol[i]%>"><%=sangCol[i] %></b>
			<%}%>
			
			<b>총 <%=sangCol.length %>개의 색상이있습니다</b><br><br>
		<%}
	%>
	추가상품: <%=sangAdd %>
	
</body>
</html>