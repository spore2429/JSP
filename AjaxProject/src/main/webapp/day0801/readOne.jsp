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
<button type="button" class="btn btn-info" id="btn1">data1.xml</button>
<button type="button" class="btn btn-info" id="btn2">data2.xml</button><br><br>
<button type="button" class="btn btn-info" id="btn3">data3.xml</button>
<button type="button" class="btn btn-info" id="btn4">data4.xml</button>
<br><br>
<div id="result">출력하는곳</div>

<script type="text/javascript">
	$("#btn1").click(function(){
	
		//alert("클릭!!!");
		//ajax로 xml읽기
		$.ajax({
			
			type:"get",
			url:"data1.xml",
			dataType:""
		});
	});
</script>
</body>
</html>