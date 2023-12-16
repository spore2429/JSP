<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberDao"%>
<%@page import="member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	.imgcss{
	
	width: 140px;	
	height: 140px;
	border-radius: 70px;
	border: 3px solid gray;
	text-align: center;
	display: block; 
	margin: 0px auto;
	}
</style>
<script type="text/javascript">
	function funcdel(num) {

			//alert(num);
			$("#btnmdel").attr("num",num);
			$("#myModal").modal(num);
		
	}

	
</script>


</head>
<%
	MemberDao dao=new MemberDao();
	ArrayList<MemberDto> list=dao.getAllMyMember();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<body>
<h3><b style="color: #ffd700;">★</b>총 <%=list.size() %>명의 회원이 있습니다<b style="color: #ffd700;">★</b></h3>
<button type="button" class="btn btn-success" onclick="location.href='../memberLogin/loginForm.jsp'">로그인</button>
<button type="button" class="btn btn-danger" onclick="location.href='../memberLogin/logoutAction.jsp'">로그아웃</button>
<br><br>

<%
	
	

	for(int i=0;i<list.size();i++)
		
	{
	
		MemberDto dto=list.get(i);
		%>
			
			
		 <table style="width: 400px;" border="2px solid gray" class="table table-bordered">		
		 
					<tr>
						<td>
						<b style='font-size:2em'>No.<%=list.size()-i %></b>
						</td>
					</tr>
					<tr>
						<td>
						<img  src="<%=dto.getImage()%>" align="left" class="imgcss">
						
							<br><b>&nbsp;아이디: <%=dto.getId() %></b>
							<br><b>&nbsp;회원명: <%=dto.getName() %></b>
							<br><b>&nbsp;핸드폰: <%=dto.getHp() %></b>
							<br><br><span style='color:#696969; float: right;'><b>&nbsp;가입일:<%=sdf.format(dto.getGaip()) %></b></span>
						</td>
					</tr>
					<%
						/* 로그인한 본이꺼만 수정/삭제 보이도록....*/
						String loginok=(String)session.getAttribute("loginok");
						String id=(String)session.getAttribute("idok");
						
						//로그인한 본인꺼만 나오도록
						if(loginok!=null && dto.getId().equals(id))
					{%>
					
					<tr>
						<td align="center">
						<button type='button' class='btn btn-primary btn-sm'
						onclick="location.href='../member/updateForm.jsp?num=<%=dto.getNum() %>'">수정</button>
						<button type='button' class='btn btn-danger btn-sm'
						onclick="funcdel(<%=dto.getNum() %>)">삭제</button>
						<% }else{%>
						
							<h5>권한없음</h5>
							<%}
						
						%>
						</td>
					</tr>
					<br>
					</table> 
	<%}
%>

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원탈퇴</h4>
        </div>
        <div class="modal-body">
          <p>회원탈퇴를 원하시면 [탈퇴확인]을 눌러주세요</p>
          <button type="button" class="btn btn-danger"
          id="btnmdel" num="">탈퇴확인</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div> 
    </div>
  </div>
 
 <script type="text/javascript">
 
 $("#btnmdel").click(function () {
	
	//버튼에 있는 num값 읽어오기
	var num=$(this).attr("num");
	//이동
	location.href="../member/deleteMember.jsp?num="+num;
	
})
 </script>
</body>
</html>