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
<div style="margin: 50px; 100px;">
	<form action="insertAction.jsp" method="post">
		<table class="table table-bordered" style="width: 500px">
			<caption align="top"><b>간단방명록</b></caption>
				<tr>
					<th width="80" style="background-color: #f0ffff;">닉네임</th>
					<td>
						<input type="text" name="nick" required="required" style="width: 120px;"> 
					</td>
					<th width="100" style="background-color: #f0ffff;">비밀번호</th>
					<td>
						<input type="password" name="pass" required="required" style="width: 120px;"> 
					</td>
				</tr>
				
				<tr>
					<td colspan="4">
					<%
						for(int i=1;i<=10;i++)
						{%>
							<input type="radio" value="<%=i%>" 
							style="width:30px;" name="image"
							<%=i==3?"checked":"" %>>&nbsp;
						<%}
					%>
					
					<br>
					<%
						for(int i=1;i<=10;i++)
						{%>
							<img src="../이미지/avata/b<%=i %>.png" style="width: 35px">
						<%}
					%>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">
						<textarea style="width: 480px; height: 150px" name="story"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="저장" class="btn btn-outline-info">
						<input type="button" value="목록" onclick="location.href='guestList.jsp'"
						class="btn btn-outline-success">
					</td>
				</tr>
		</table>
	</form>
	</div>
</body>
</html>