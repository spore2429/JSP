<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#selphoto{
		
		position: absolute;
		left: 500px;
		top: 100px;
		width: 150px;
		border-radius: 20px
	}
	
	
</style>

<script>
	$(function(){
		
		//select된 선택값 얻기
		var srcImg=$("#photo").val();
		
		//selphoto에 넣기
		$("#selphoto").attr("src",srcImg);
		
		$("#photo").change(function(){
			
			var s=$(this).val();
			$("#selphoto").attr("src",s);
		})	
	})
</script>
</head>
<body>
<div>
<form action="insertAction.jsp" method="post">
	<table class="table table-bordered" style="width: 300px">
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" name="sangpum" class="form-control"
			required="required" style="width: 120px" placeholder="상품명">
		</td>
	</tr>
	
	<tr>
		<th>상품선택</th>
		<td>
			<select name="photo" id="photo" class="form-select" style="width: 100px"> 
				<option value="../이미지/쇼핑몰사진/1.jpg" >코트</option>
				<option value="../이미지/쇼핑몰사진/2.jpg">원피스</option>
				<option value="../이미지/쇼핑몰사진/3.jpg">모자</option>
				<option value="../이미지/쇼핑몰사진/4.jpg">바지</option>
				<option value="../이미지/쇼핑몰사진/5.jpg">셔츠</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>가격</th>
		<td>
			<input type="text" name="price" class="form-control"
			required="required" style="width: 120px" placeholder="가격">
		</td>
	</tr>
	
	<tr>
		<th>입고일</th>
		<td>
			<input type="date" name="ipgo" class="form-control"
			required="required" style="width: 140px" placeholder="입고일">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<button type="submit" class="btn btn-info">상품정보저장</button>
		<button type="button" class="btn btn-success"
		onclick="location.href='list.jsp'">목록으로이동</button>
		</td>
	</tr>
	</table>
</form>
</div>
<img src="" id="selphoto">
</body>
</html>