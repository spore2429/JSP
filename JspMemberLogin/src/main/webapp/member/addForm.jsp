<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#tablecss{

background-image:url("../이미지/Other_img/ocean.jpg");
color: #f0ffff ;
}
</style>
<script type="text/javascript">
$(function () {
	$("#btnGaip").click(function() {
		
		if(mfrm.mid.value.length==0){
			alert("아이디 입력버튼을 눌러주세요");
			return false;
		}
	})	
	
	
})
</script>
</head>
<body>
  <div style="margin: 50px; 100px;">
  	<form action="addProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
  		<table class="table table-bordered" style="width: 400px;" id="tablecss">
  			<caption align="top"><b style="color: gray;">< 회원가입 ></b></caption>
  			<tr>
  				<td width="80" style="background-color: #00bfff"><b>아이디</b></td>
  				<td>
  					<input type="text" class="form-control" name="id" id="mid" style="width: 120px;"
  					readonly="readonly" required="required">
  					<button type="button" class="btn btn-danger btn-sm" 
  					onclick="openId()">아이디입력</button>
  				</td>
  			</tr>
  			<tr>
  				<td width="80" style="background-color: #00bfff"><b>비밀번호</b></td>
  				<td>
  					<input type="password" class="form-control" style="width: 120px;"
  					name="pass" required="required">
  				</td>
  			</tr>
  			
  			<tr>
  				<td width="80" style="background-color: #00bfff"><b>이름</b></td>
  				<td>
  					<input type="text" class="form-control" style="width: 120px;"
  					name="name" required="required">
  				</td>
  			</tr>
  			
  			<tr>
  				<td width="80" style="background-color: #00bfff"><b>사진</b></td>
  				<td>
  					<input type="file" class="form-control" style="width: 250px;"
  					name="uploadImage">
  				</td>
  			</tr>
  			
  			<tr>
  				<td width="80" style="background-color: #00bfff"><b>핸드폰</b></td>
  				<td>
  					<input type="text" class="form-control" style="width: 200px;"
  					name="hp" required="required">
  				</td>
  			</tr>
  			
  			<tr>
  				<td colspan="2" align="center">
  					<button type="submit" class="btn btn-success" id="btnGaip">입력완료</button>
  					<button type="button" class="btn btn-warning" onclick="location.href='memberList.jsp'">회원목록</button>
  				</td>
  			</tr>
  		</table>
  		
  	</form>
  </div>
  
  <script type="text/javascript">
  	function openId() {
		window.open("idcheck.jsp","e","left=400px, top=100px, width=300px, height=250px");
	}
  </script>
</body>
</html>