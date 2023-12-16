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
		
		//중복체크
		$("#btncheck").click(function() {
			
			//id읽기
			var id=$("#id").val();
			//alert(id);
			
			$.ajax({
				
				type:"get",
				url:"member/idsearch.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(data){
					
					//alert(data.count);
					if(data.count==1)
					{//alert("이미 가입된 아이디 입니다\n다시 입력해주세요"); //br 태그안됨 \n 사용
						$("span.idsuccess").text("fail").css("color","red");
						$("#id").val("");
						$("#id").focus();
						
					
						
					}else{	
						//alert("사용 가능한 아이디입니다");
						$("span.idsuccess").text("success").css("color","blue");
					
						}
				}
			});
		});
		
		//선택 이메일 주소 넣기
		$("#selemail").change(function(){
			
			if($(this).val()=='-'){
				$("#email2").val("");
				$("#email2").focus();
			}
			else{
				$("#email2").val($(this).val());
			}	
		})
		
	});
	
	function check(f) 
	{
		if(f.pass.value!=f.pass2.value)
			{
			alert("비밀번호가 서로 다릅니다");
			f.pass.value="";
			f.pass2.value="";
			
			return false; //action이 호출되지 안는다
			}
	}
	
	
</script>
</head>
<body>
<div style="margin-left: 300px">
<form action="member/memberproc.jsp" method="post" onsubmit="return check(this)">
  <table class="table table-bordered" style="width: 500px;" >
  	<caption align="top"><b>회원가입</b></caption>
  	<tr>
  	  <th style="width: 100px; background-color: #eee8aa">아이디</th>
  	  <td>
  	    <input type="text" name="id" id="id" class="form-group"
  	    required="required" style="width: 120px;">
  	    <button type="button" class="btn btn-danger btn-sm"
  	    id="btncheck">중복체크</button>
  	    
  	    <span class="idsuccess"></span>
  	  </td>
  	</tr>
  	
  	<tr>
  	  <th style="width: 100px; background-color: #eee8aa">비밀번호</th>
  	  <td>
  	    <input type="password" name="pass" placeholder="비밀번호"
  	    required="required" style="width: 120px;">
  	    <input type="password" name="pass2" placeholder="비밀번호 확인"
  	    required="required" style="width: 120px;">
  	  </td>
  	</tr>
  	
  	<tr>
  	  <th style="width: 100px; background-color: #eee8aa">회원명</th>
  	  <td>
  	    <input type="text" name="name" placeholder="이름"
  	    required="required" style="width: 150px;">
  	  </td>
  	</tr>
  	
  	<tr>
  	  <th style="width: 100px; background-color: #eee8aa">핸드폰</th>
  	  <td>
  	    <input type="text" name="hp" placeholder="휴대폰"
  	    required="required" style="width: 200px;">
  	  </td>
  	  
  	  	<tr>
  	  <th style="width: 100px; background-color: #eee8aa">주소</th>
  	  <td>
  	    <input type="text" name="addr" placeholder="주소"
  	    required="required" style="width: 350px;">
  	  </td>
  	</tr>

  	
  	<tr>
  		<th style="width: 100px; background-color: #eee8aa;">이메일</th>
  		<td>
  			<input type="text" name="email1" class="form-group"
  			required="required" style="width: 120px;">
  			<b>@</b>
  			<input type="text" name="email2" id="email2"
  			required="required" style="width: 120px;">
  			<select id="selemail">
  				<option value="-">직접입력</option>
  				<option value="naver.com">네이버</option>
  				<option value="gmail.com">구글</option>
  				<option value="hanmail.net">다음</option>
  				<option value="nate.com">네이트</option>
  			</select>
  		</td>
  	</tr>
  	<tr>
  	  <td colspan="2" align="center">
  	    <button type="submit"   class="btn btn-outline-info"
  	    style="width: 100px;">회원가입</button>
  	     <button type="reset" class="btn btn-outline-info"
  	    style="width: 100px;">초기화</button>
  	  </td>
  	</tr>
  </table>
</form>
</div>
</body>
</html>