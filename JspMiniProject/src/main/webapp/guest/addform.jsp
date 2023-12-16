<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		$("i.camera").click(function() {
			
			$("#photo").trigger("click");
		})
	});
	
	   function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	           reader.onload = function (e) {
	           //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	               //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
	               $('#showimg').attr('src', e.target.result);
	           }
	           //File내용을 읽어 dataURL형식의 문자열로 저장 
	           reader.readAsDataURL(input.files[0]);
	       }
	   }

</script>
</head>
<body>

<!-- 이미지 미리보기 -->
<img  src="" id="showimg" style="position: absolute; left: 650px; top: 60px;
max-width: 200px;">

<form action="guest/addproc.jsp" method="post" enctype="multipart/form-data">
  <table class="table table-bordered" style="width: 600px;">
  	
  	<caption align="top"><b>방명록 등록</b>
  	<i class="bi bi-camera-fill camera" style="cursor: pointer; font-size: 33px;"></i>
  	<input type="file" name="photo" id="photo" style="visibility: hidden;"
  	onchange="readURL(this)">
  	</caption>
  	
  	<tr height="100">
  	  <td width="520">
  	  	<textarea style="width: 500px; height: 100px;"
  	  	name="content" required="required" class="form-control"></textarea>
  	  </td>
  	  <td>
  	  	<button type="submit" class="btn btn-outline-info"
  	  	style="width: 100px; height: 100px;">등록</button>
  	  </td>
  	</tr>
  </table>
</form>
</body>
</html>