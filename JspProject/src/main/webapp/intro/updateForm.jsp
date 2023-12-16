<%@page import="java.util.StringTokenizer"%>
<%@page import="model.intro.IntroDao"%>
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

String intro_num=request.getParameter("intro_num");
IntroDao dao=new IntroDao();
IntroDto dto=dao.getData(intro_num);

	String str =dto.getIntro_hp();
	
	String result1="";
	String result2="";
	String result3="";
	
	if(str.length()==13)
	{
		result1=str.substring(0,3);
		result2=str.substring(4,8);
		result3=str.substring(9,13);   
	}
	
	else
	{
		result1=str.substring(0,3);
		result2=str.substring(4,7);
		result3=str.substring(8,12);
	}


%>
<body>
<form action="updateAction.jsp" method="post">
	<input type="hidden" name="intro_num" value="<%=intro_num%>">
	<table class="table table-bordered" style="width: 400px">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" class="form-control"
			required="required" style="width: 80px" placeholder="이름"
			value="<%=dto.getIntro_name()%>">
			
		</td>
	</tr>
	
	<tr>
		<th>혈액형</th>
		<td>
			<select name="blood" class="form-select" style="width: 80px"> 
				<option value="A형" <%=dto.getIntro_blood().equals("A형")?"selected":"" %>>A형</option>
				<option value="B형" <%=dto.getIntro_blood().equals("B형")?"selected":"" %>>B형</option>
				<option value="AB형" <%=dto.getIntro_blood().equals("AB형")?"selected":"" %>>AB형</option>
				<option value="O형" <%=dto.getIntro_blood().equals("O형")?"selected":"" %>>O형</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>
			
		
			<select name=hp1 id="hp1" style="width: 80px">

            <option value="010" <%=result1.equals("010")?"selected":"" %>>010</option>
            <option value="017" <%=result1.equals("017")?"selected":"" %>>017</option>
            <option value="019" <%=result1.equals("019")?"selected":"" %>>019</option>
            <option value="031" <%=result1.equals("031")?"selected":"" %>>031</option>
			</select>
			<b>-</b>
			<input type="text" name="hp2" id="hp2" value="<%=result2 %>"
			required="required" maxlength="4" size="4" style="width: 80px">
			<b>-</b>
			<input type="text" name="hp3" id="hp3" value="<%=result3 %>"
			required="required" maxlength="4" size="4" style="width: 80px">
		</td>
	</tr>
	
	<tr>
		<th>거주지</th>
		<td>
			<input type="radio" name="city" value="서울" <%=dto.getIntro_city().equals("서울")?"checked":"" %>
			required="required"  placeholder="거주지">서울
			<input type="radio" name="city" value="부산" <%=dto.getIntro_city().equals("부산")?"checked":"" %>
			required="required"  placeholder="거주지">부산
			<input type="radio" name="city" value="대구" <%=dto.getIntro_city().equals("대구")?"checked":"" %>
			required="required"  placeholder="거주지">대구
			<input type="radio" name="city" value="제주" <%=dto.getIntro_city().equals("제주")?"checked":"" %>
			required="required"  placeholder="거주지">제주
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<button type="submit" class="btn btn-info">학생정보수정</button>
		<button type="button" class="btn btn-success"
		onclick="location.href='list.jsp'">목록으로이동</button>
		</td>
	</tr>
	</table>
</form>
<script type="text/javascript">
$(function(){
	
	$('#hp2').on('keyup',function(){
		
		if(this.value.length==4)
			$('#hp3').focus();
	});
	
	
</script>
</body>
</html>