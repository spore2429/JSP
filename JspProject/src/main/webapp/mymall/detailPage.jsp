<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="model.mymall.MallDao"%>
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
<style>
	

</style>
</head>

<%
	String num=request.getParameter("num");
	MallDao dao=new MallDao();
	MallDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>

	<input type="hidden" name="num" value="<%=num %>">
	<table class="table table-bordered" style="width: 400px" border="none" >
	<tr>
		<th>상품명</th>
		<td><%=dto.getSangpum() %></td>
	</tr>
	
	<tr>
		<th>상품사진</th>
		<td><img src='<%=dto.getPhoto() %>' width="100px" height="100px"></td>
	</tr>
	
	<tr>
		<th>가격</th>
		<td><%=nf.format(Integer.parseInt(dto.getPrice()))%></td>
	</tr>
	
	<tr>
		<th>입고일</th>
		<td><%=dto.getIpgo() %></td>
	</tr>
	
	<tr>
		<th>등록일</th>
		<td><%=sdf.format(dto.getWriteday()) %></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<button type="button" class="btn btn-success"
		onclick="location.href='list.jsp'">목록으로이동</button>
		</td>
	</tr>
	</table>


</body>
</html>