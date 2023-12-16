<%@page import="java.util.function.Function"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.intro.IntroDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.intro.IntroDto"%>
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
		IntroDao dao=new IntroDao();
		ArrayList<IntroDto> list=dao.getAllMyIntro();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
<body>
	<a href="insertForm.jsp">학생추가</a>
	<br>
	<table class="table table-bordered" style="width: 800px">
		<tr align="center" class="table-warning">
			<th width="100px">번호</th>
			<th width="100px">이름</th>
			<th width="100px">혈액형</th>
			<th width="100px">전화번호</th>
			<th width="100px">거주지</th>
			<th width="100px">등록일</th>
			<th width="100px">수정|삭제</th>
		</tr>
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
				IntroDto dto=list.get(i);
				%>
				
				<tr>
				
				<td align="center" valign="middle"><%=i+1 %></td>
				<td align="center" valign="middle" onclick="location.href='detailpage.jsp?intro_num=<%=dto.getIntro_num()%>'">
				<b><%=dto.getIntro_name() %></b></td>
				<td align="center" valign="middle"><%=dto.getIntro_blood() %>
				<td align="center" valign="middle"><%=dto.getIntro_hp() %></td>
				<td align="center" valign="middle"><%=dto.getIntro_city() %></td>
				<td align="center" valign="middle"><%=sdf.format(dto.getGaipday()) %></td>
				<td align="center" valign="middle">
				<button type="button" class="btn btn-info btn-sm" 
				onclick="location.href='updateForm.jsp?intro_num=<%=dto.getIntro_num()%>'">수정</button>
				<button type="button" class="btn btn-danger btn-sm" 
				onclick="del(<%=dto.getIntro_num() %>)">삭제</button></td>
				</tr>
				
			
				
				
				
				
				
				
				
			<%}
		}
	%>
	
	<script>
		function del(intro_num) {
			
			var ans=confirm("정말 삭제하시겠습니까?");
			
			if(ans)
				{
					location.href='deleteIntro.jsp?intro_num='+intro_num;
					alert("삭제가 완료되었습니다");		
				}
			else
					alert("삭제를 취소하였습니다");
		}
	</script>
</table>
</body>
</html>