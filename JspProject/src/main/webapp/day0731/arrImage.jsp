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
	String [] str={"1.png","2.png","3.png","4.png","5.png","6.png","7.png","8.png","9.png","10.png","11.png",
			"12.png","13.png","14.png","15.png","16.png"};
	int n=0;
%>

<table class="table table-bordered" style="width: 460px;">
	<%
	for(int i=0;i<4;i++)
	{%>
		<tr>
		<%
			for(int j=0;j<4;j++)
			{%>
				<td>
				<img src="../만화이미지/<%=str[n]%>">
				</td>
			<%
				n++; 
			}
		%>
		</tr>
	<%}
	%>

</table>
</body>
</html>