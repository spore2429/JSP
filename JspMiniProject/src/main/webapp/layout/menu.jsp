<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
div ul {
   margin-top: 35px;
}
</style>
<title>Insert title here</title>
<% 
//절대경로잡기
String root=request.getContextPath();
String myid=(String)session.getAttribute("myid");
String loginok=(String)session.getAttribute("loginok");
%>

<link rel="stylesheet" type="text/css"
   href="<%=root %>/menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css"
   href="<%=root %>/menu/css/menu.css">

<script type="text/javascript" src="<%=root %>/menu/js/jquery.js"></script>
<script type="text/javascript" src="<%=root %>/menu/js/function.js"></script>
</head>
<body>
<body>
   <%-- <a href="<%=root %>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>/">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>/index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>/">Q & A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>/">회원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>/">Shop</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
   <div id="wrap" style="margin-top: 20px;">
      <header>
         <div class="inner relative" style="margin-top: 30px">
            <a class="logo" href="#"></a> <a id="menu-toggle"
               class="button dark" href="#"><i class="icon-reorder"></i></a>
            <nav id="navigation">
               <ul id="main-menu" style="font-size: 80px;">
                  <li class="current-menu-item"><a href="<%=root %>">Home</a></li>
                  <li class="parent"><a href="#">회원</a>
                     <ul class="sub-menu">
                        <li><a href="<%=root%>/index.jsp?main=login/loginmain.jsp"><i
                              class="bi bi-emoji-smile"></i>로그인</a></li>
                        <li><a
                           href="<%=root%>/index.jsp?main=member/memberform.jsp"><i
                              class="bi bi-person-plus-fill"></i>회원가입</a></li>
                              
                              <%
                              if(loginok!=null && myid.equals("admin")){%>
                           <li><a
                           href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i
                              class="bi bi-person-square"></i>회원목록</a></li>
                              <% }
                              %>
                                                      
                        <li><a href="<%=root%>/index.jsp?main=member/myinfo.jsp"><i
                              class="bi bi-person-square"></i>나의정보</a></li>
                     </ul></li>
                  <li class="parent"><a
                     href="<%=root%>/index.jsp?main=guest/guestlist.jsp">회원방명록</a></li>
                  <li class="parent"><a href="#">고객의 소리</a>
                     <ul class="sub-menu">
                        <li><a href="<%=root %>/index.jsp?main=board/boardlist.jsp">스마트게시판</a></li>
                        <li><a href="#">Q & A</a></li>
                        </ul></li>
                  <li><a href="<%=root %>/index.jsp?main=load/map.jsp">찾아오시는 길</a></li>
                     <li class="parent"><a href="#">ShoppingMall</a>
                     <ul class="sub-menu">
                              <%
                              if(loginok!=null && myid.equals("admin")){%>
                           <li><a
                           href="<%=root%>/index.jsp?main=shop/addform.jsp"><i
                              class="bi bi-person-square"></i>상품등록</a></li>
                              <% }
                              %>
                                                      
                        <li><a href="<%=root%>/index.jsp?main=shop/shoplist.jsp"><i
                              class="bi bi-person-square"></i>상품목록</a></li>
                     </ul></li>
               </ul>
               
            </nav>
            <div class="clear"></div>
         </div>
      </header>
   </div>
</body>
</html>