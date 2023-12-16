<%@page import="java.text.NumberFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.mymall.MallDao"%>
<%@page import="java.util.List"%>
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
		//한글엔코딩
		request.setCharacterEncoding("utf-8");	
	
		MallDao dao=new MallDao();
		ArrayList<MallDto> list = dao.getAllMyMall();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
<body>
	<a href="insertForm.jsp">상품추가</a>
	<br>
	<table class="table table-bordered" style="width: 800px">
	<tr align="center" class="table-warning">
		<th width="60">번호</th>
		<th width="140">상품명</th>
		<th width="160">상품사진</th>
		<th width="120">가격</th>
		<th width="140">입고일</th>
		<th width="140">작성일</th>
		<th width="160">수정|삭제</th>
	</tr>
<%
	if(list.size()==0)
	{%>
		<tr>
			<td colspan="6" align="center">
			<h5>등록된 상품이 없습니다</h5>
			</td>
		</tr>
		
	<%}else
	   {
			NumberFormat nf=NumberFormat.getCurrencyInstance();
		
	for(int i=0;i<list.size();i++)
	{
		MallDto dto=list.get(i);
		%>
		
		<tr>
		<td align="center" valign="middle"><%=i+1 %></td>
		<td align="center" valign="middle"><b><%=dto.getSangpum() %></b></td>
		<td align="center"><img src='<%=dto.getPhoto() %>' width="60px" height="60px" class="img-thumbnail"
		onclick="location.href='detailPage.jsp?num=<%=dto.getNum()%>'"></td>
		<td align="center" valign="middle"><%=nf.format(Integer.parseInt(dto.getPrice()))%></td>
		<td align="center" valign="middle"><%=dto.getIpgo() %></td>
		<td align="center" valign="middle"><%=sdf.format(dto.getWriteday()) %></td>
		<td align="center" valign="middle">
			<button type="button" class="btn btn-info btn-sm" 
			onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button" class="btn btn-danger btn-sm" 
			onclick="funcdel(<%=dto.getNum() %>)">삭제</button></td>
		</tr>
	<%}

	   }
%>

<script>
function funcdel(num) {
var ans=confirm("정말삭제하시겠습니까?");
	
	if(ans)
	{
		location.href='deleteMymall.jsp?num='+num;
		alert("삭제가 완료되었습니다.");
	}
	else
		alert("삭제가 취소되었습니다.");

}

</script>
	</table>
</body>
</html>
