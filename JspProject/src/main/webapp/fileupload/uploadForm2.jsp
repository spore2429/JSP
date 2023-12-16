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
<form action="uploadProc2.jsp" method="post"
enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 400px">
		<caption align="top"><b>여러개이미지 업로드</b></caption>
		
			<tr>
				<th width="100">작성자</th>
				<td>
					<input type="text" name="nick" class="form-control"
					style="width: 150px">
				</td>
			</tr>
			<tr>
				<th>이미지</th>
					<td>
						<input type="file" name="photo1" class="form-control">
						<input type="file" name="photo2" class="form-control">
						<input type="file" name="photo3" class="form-control">
					</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-warning">서버에 업로드하기</button>
				</td>
			</tr>
	</table>
</form>
</body>
</html>