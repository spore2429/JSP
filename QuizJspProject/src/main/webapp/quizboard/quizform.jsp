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
  <div style="margin: 50px; 100px;" >
  	<form action="quizaction.jsp" method="post" enctype="multipart/form-data" class="form-inline">
  		<table class="table table-bordered" style="width: 400px;" id="tablecss">
  		<caption align="top"><b><i class="bi bi-pencil"></i>글쓰기</b></caption>
  			
  			<tr>
				<th style="background-color: #00bfff" >작성자</th>
				<td>
					<input type="text" name="writer" class="form-control"
					required="required" autofocus="autofocus" style="width: 150px;">
				</td>
			</tr>
  
  			<tr>
				<th style="background-color: #00bfff">제목</th>
				<td>
					<input type="text" name="title" class="form-control"
						required="required" style="width: 270px;">
				</td>
			</tr>
				
			<tr><!-- 내용 -->
				<td colspan="2">
					<textarea style="width: 390px; height: 150px;"
					class="from-control" required="required" name="content"></textarea>
				</td>
			</tr>
  			
  			<tr>
  				<td width="80" style="background-color: #00bfff"><b>이미지</b></td>
  				<td>
  					<input type="file" class="form-control" style="width: 250px;"
  					name="imgname">
  				</td>
  			</tr>
  			
  			<tr>
				<td colspan="2" align="center">
				<!-- type이 image이거나 submit이면 기본이 submit입니다 -->
					<input type="image" src="../이미지/Other_img/submit.png" style="width: 70px;">
					<input type="image" src="../이미지/Other_img/list.png" style="width: 70px;"
					onclick="location.href='quizlist.jsp'; return false;">
				</td>
			</tr>
  		</table>
  		
  	</form>
  </div>
</body>
</html>