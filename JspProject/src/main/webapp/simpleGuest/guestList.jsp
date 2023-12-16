<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleguest.SimpleGuestDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.simpleguest.SimpleGuestDao"%>
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
<%
	SimpleGuestDao dao=new SimpleGuestDao();
	ArrayList<SimpleGuestDto> list=dao.getAllMySimpleGuest();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div style="margin: 50px; 100px;">
<button type="button" class="btn btn-outline-success" 
	onclick="location.href='insertForm.jsp'">글쓰기</button>
	<br><br>
				
		<%
		if(list.size()==0)
			{%>
			
			<tr>
			<td colspan="6" align="center">
			<h5>등록된 정보가 없습니다</h5>
			</td>
			</tr>
	
			<%}else{
				
				
				for(int i=0;i<list.size();i++)
				{
					SimpleGuestDto dto=list.get(i);
					int no=list.size()-i;
					%>
					
					<%-- <table class="table table-bordered" style="width: 400px">		
					<tr>
						<td>
						<b style='font-size:2em'>NO:<%=no %></b>
						</td>
					</tr>
					<tr>
						<td>
						<img  src="../이미지/avata/b<%=dto.getImage()%>.png" align='left' width='75px'>
							<br><b>&nbsp;작성자:<%=dto.getNick() %></b>
							<br><span style='color:gray;'>&nbsp;<%=sdf.format(dto.getWriteday()) %></span>
						</td>
					</tr>
					<tr height='150'>
						<td>
							<pre><%=dto.getStory() %></pre>
						</td>
					</tr>
					<tr>
						<td align="center">
						<button type='button' class='btn btn-primary' id='btn3' num='"+data.num+"'>수정</button>
						<button type='button' class='btn btn-danger' id='btn4' num='"+data.num+"'>삭제</button>
						</td>
					</tr>
					</table> --%>
				
					<table class="table" style="width: 400px">	
						<tr>
							<td align="center">
								<b>No<%=no %></b>
								<b><%=dto.getNick() %></b>
							</td>
							<td align="right">
								<b style="color: gray;"><%=sdf.format(dto.getWriteday()) %></b>
							</td>
						
						
						</tr>
						
						<tr height="100">
							<td colspan="2" valign="middle">
								
								<img src="../이미지/avata/b<%=dto.getImage()%>.png" width="60" height="60"
								align="left" hspace="20">
								<pre><%=dto.getStory() %></pre>
							</td>
						</tr>
						<tr>
							<td align="center">
							<input type='button' class='btn btn-primary btn-sm' value="수정" 
							onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">
							<input type='button' class='btn btn-danger btn-sm' value="삭제" 
							onclick="location.href='deleteForm.jsp?num=<%=dto.getNum()%>'">
							</td>
					</tr>
					</table>
				<%}
			}
	
	%>
	
</div>
</body>
</html>