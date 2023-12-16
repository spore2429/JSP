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
<script type="text/javascript">
$(function(){
	
	$('#hp2').on('keyup',function(){
		
		if(this.value.length==4)
			$('#hp3').focus();
	});
	
});
</script>
</head>
<body>
<form action="insertAction.jsp" method="post">
	<table class="table table-bordered" style="width: 400px">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" class="form-control"
			required="required" style="width: 80px" placeholder="이름">
		</td>
	</tr>
	
	<tr>
		<th>혈액형</th>
		<td>
			<select name="blood" id=blood class="form-select" style="width: 80px"> 
				<option value="A형">A형</option>
				<option value="B형">B형</option>
				<option value="AB형">AB형</option>
				<option value="O형">O형</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>
			<select name=hp1 id="hp1" style="width: 80px">


            <option>010</option>
            <option>031</option>
            <option>017</option>
            <option>019</option>
			</select>
			<b>-</b>
			<input type="text" name="hp2" id="hp2"
			required="required" maxlength="4" size="4" style="width: 80px">
			<b>-</b>
			<input type="text" name="hp3" id="hp3"
			required="required" maxlength="4" size="4" style="width: 80px">
		</td>
	</tr>
	
	<tr>
		<th>거주지</th>
		<td>
			<input type="radio" name="city" value="서울"
			required="required"  placeholder="거주지">서울
			<input type="radio" name="city" value="부산"
			required="required"  placeholder="거주지">부산
			<input type="radio" name="city" value="대구"
			required="required"  placeholder="거주지">대구
			<input type="radio" name="city" value="제주"
			required="required"  placeholder="거주지">제주
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<button type="submit" class="btn btn-info">학생정보저장</button>
		<button type="button" class="btn btn-success"
		onclick="location.href='list.jsp'">목록으로이동</button>
		</td>
	</tr>
	</table>
</form>
</body>
</html>