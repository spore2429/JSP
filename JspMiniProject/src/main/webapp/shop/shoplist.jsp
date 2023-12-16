<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gugi&family=Orbit&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style type="text/css">
img.photo {
   width: 200px;
   height: 230px;
   border: 1px solid gray;
   border-radius: 20px;
   margin-bottom: 10px;
}

tr {
   padding: 10px;
}
</style>
<script type="text/javascript">
  $(function(){
   
     //이미지 누르면 shopnum 경고창으로 띄우기
    $("a.godetail").click(function() {
       
       var shopnum=$(this).attr("shopnum");
       
       //디테일페이지로 가기
       location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
      
   })
})
</script>

<title>Insert title here</title>
</head>
<body>
   <%
ShopDao dao=new ShopDao();
List<ShopDto> list=dao.getAllSangpums();
%>

   <div class="container mt-3">
      <h2>Toggleable Tabs</h2>
      <br>
      <!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
         <li class="nav-item"><a class="nav-link active"
            data-bs-toggle="tab" href="#tabs-1">전체</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
            href="#tabs-2">아우터</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
            href="#tabs-3">상의</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
            href="#tabs-4">하의</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
            href="#tabs-5">악세서리</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
            href="#tabs-6">세트</a></li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
         <div id="tabs-1" class="container tab-pane active">
            <br>
            <p>
            <table class="table table-bordered" style="width: 700px;">
               <caption align="top">
                  <b>전체상품목록</b>
               </caption>
               <%
             NumberFormat nf = NumberFormat.getCurrencyInstance();
             int i = 0; // 이미지 개수를 세는 변수
             for (ShopDto dto : list) {
          
                String photo = dto.getPhoto();
            // 20~50%까지 랜덤 할인율
             int sale = (int) (Math.random() * 31) + 20;
                %>
                  
         <%
           if (i % 5 == 0) {%>
            <tr>
            <!-- 새로운 행 시작 -->
      <%}
           %>
            <td>
            <a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
            <img alt="" src="shopsave/<%=photo%>" class="photo">
            </a>
            
            <br> <%=dto.getSangpum()%><br> 
            
            <b style="color: red; font-size: 1.2em;"><%=sale%>%</b> 
            <span style="float: right;">
            
            <div style="color: gray; font-size: 13px;">
               <%
                      int price = (int) (dto.getPrice() - (dto.getPrice()) * (sale / 100.0));
                    %>
                  <%=nf.format(price)%>
            </div>
            
            <div style="color: black; font-size: 16px;">
               <strike><%=nf.format(dto.getPrice())%></strike>
            </div>
            
            </span>
            
            </td>
               
               <%
                 if (i % 5 == 4) {
                 %>
                  </tr>
                  <!-- 행 종료 -->
               <%
                 }
                 %>
                 
                <%
                 i++;
                 }
                 %>
               </table>
   
               </p>
            </div>
   
            <div id="tabs-2" class="container tab-pane">
               <br>
               <p><table class="table table-bordered" style="width: 700px;">
               <caption align="top">
                  <b>아우터목록</b>
               </caption>
               <%
            
             i = 0; // 이미지 개수를 세는 변수
             for (ShopDto dto : list) {
             if(dto.getCategory().equals("아우터"))
             {
                String photo = dto.getPhoto();
            // 20~50%까지 랜덤 할인율
             int sale = (int) (Math.random() * 31) + 20;
                %>
                  
         <%
           if (i % 5 == 0) {%>
            <tr>
            <!-- 새로운 행 시작 -->
      <%}
           %>
            <td>
            <a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
            <img alt="" src="shopsave/<%=photo%>" class="photo">
            </a>
            
            <br> <%=dto.getSangpum()%><br> 
            
            <b style="color: red; font-size: 1.2em;"><%=sale%>%</b> 
            <span style="float: right;">
            
            <div style="color: gray; font-size: 13px;">
               <%
                      int price = (int) (dto.getPrice() - (dto.getPrice()) * (sale / 100.0));
                    %>
                  <%=nf.format(price)%>
            </div>
            
            <div style="color: black; font-size: 16px;">
               <strike><%=nf.format(dto.getPrice())%></strike>
            </div>
            
            </span>
            
            </td>
               
               <%
                 if (i % 5 == 4) {
                 %>
                  </tr>
                  <!-- 행 종료 -->
               <%
                 }
                 %>
                 
                <%
                 i++;
             }
                 }
       
                 %>
               </table></p>
            </div>
   
            <div id="tabs-3" class="container tab-pane">
               <br>
               <p><table class="table table-bordered" style="width: 700px;">
               <caption align="top">
                  <b>상의목록</b>
               </caption>
               <%
            
             i = 0; // 이미지 개수를 세는 변수
             for (ShopDto dto : list) {
             if(dto.getCategory().equals("상의"))
             {
                String photo = dto.getPhoto();
            // 20~50%까지 랜덤 할인율
             int sale = (int) (Math.random() * 31) + 20;
                %>
                  
         <%
           if (i % 5 == 0) {%>
            <tr>
            <!-- 새로운 행 시작 -->
      <%}
           %>
            <td>
            <a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
            <img alt="" src="shopsave/<%=photo%>" class="photo">
            </a>
            
            <br> <%=dto.getSangpum()%><br> 
            
            <b style="color: red; font-size: 1.2em;"><%=sale%>%</b> 
            <span style="float: right;">
            
            <div style="color: gray; font-size: 13px;">
               <%
                      int price = (int) (dto.getPrice() - (dto.getPrice()) * (sale / 100.0));
                    %>
                  <%=nf.format(price)%>
            </div>
            
            <div style="color: black; font-size: 16px;">
               <strike><%=nf.format(dto.getPrice())%></strike>
            </div>
            
            </span>
            
            </td>
               
               <%
                 if (i % 5 == 4) {
                 %>
                  </tr>
                  <!-- 행 종료 -->
               <%
                 }
                 %>
                 
                <%
                 i++;
             }
                 }
       
                 %>
               </table></p>
            </div>
   
            <div id="tabs-4" class="container tab-pane">
               <br>
               <p><table class="table table-bordered" style="width: 700px;">
               <caption align="top">
                  <b>하의목록</b>
               </caption>
               <%
            
             i = 0; // 이미지 개수를 세는 변수
             for (ShopDto dto : list) {
             if(dto.getCategory().equals("하의"))
             {
                String photo = dto.getPhoto();
            // 20~50%까지 랜덤 할인율
             int sale = (int) (Math.random() * 31) + 20;
                %>
                  
         <%
           if (i % 5 == 0) {%>
            <tr>
            <!-- 새로운 행 시작 -->
      <%}
           %>
            <td>
            <a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
            <img alt="" src="shopsave/<%=photo%>" class="photo">
            </a>
            
            <br> <%=dto.getSangpum()%><br> 
            
            <b style="color: red; font-size: 1.2em;"><%=sale%>%</b> 
            <span style="float: right;">
            
            <div style="color: gray; font-size: 13px;">
               <%
                      int price = (int) (dto.getPrice() - (dto.getPrice()) * (sale / 100.0));
                    %>
                  <%=nf.format(price)%>
            </div>
            
            <div style="color: black; font-size: 16px;">
               <strike><%=nf.format(dto.getPrice())%></strike>
            </div>
            
            </span>
            
            </td>
               
               <%
                 if (i % 5 == 4) {
                 %>
                  </tr>
                  <!-- 행 종료 -->
               <%
                 }
                 %>
                 
                <%
                 i++;
             }
                 }
       
                 %>
               </table></p>
            </div>
   
            <div id="tabs-5" class="container tab-pane">
               <br>
               <p><table class="table table-bordered" style="width: 700px;">
               <caption align="top">
                  <b>악세서리목록</b>
               </caption>
               <%
            
             i = 0; // 이미지 개수를 세는 변수
             for (ShopDto dto : list) {
             if(dto.getCategory().equals("악세서리"))
             {
                String photo = dto.getPhoto();
            // 20~50%까지 랜덤 할인율
             int sale = (int) (Math.random() * 31) + 20;
                %>
                  
         <%
           if (i % 5 == 0) {%>
            <tr>
            <!-- 새로운 행 시작 -->
      <%}
           %>
            <td>
            <a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
            <img alt="" src="shopsave/<%=photo%>" class="photo">
            </a>
            
            <br> <%=dto.getSangpum()%><br> 
            
            <b style="color: red; font-size: 1.2em;"><%=sale%>%</b> 
            <span style="float: right;">
            
            <div style="color: gray; font-size: 13px;">
               <%
                      int price = (int) (dto.getPrice() - (dto.getPrice()) * (sale / 100.0));
                    %>
                  <%=nf.format(price)%>
            </div>
            
            <div style="color: black; font-size: 16px;">
               <strike><%=nf.format(dto.getPrice())%></strike>
            </div>
            
            </span>
            
            </td>
               
               <%
                 if (i % 5 == 4) {
                 %>
                  </tr>
                  <!-- 행 종료 -->
               <%
                 }
                 %>
                 
                <%
                 i++;
             }
                 }
       
                 %>
               </table></p>
            </div>
   
            <div id="tabs-6" class="container tab-pane">
               <br>
               <p><table class="table table-bordered" style="width: 700px;">
               <caption align="top">
                  <b>세트목록</b>
               </caption>
               <%
            
             i = 0; // 이미지 개수를 세는 변수
             for (ShopDto dto : list) {
             if(dto.getCategory().equals("세트"))
             {
                String photo = dto.getPhoto();
            // 20~50%까지 랜덤 할인율
             int sale = (int) (Math.random() * 31) + 20;
                %>
                  
         <%
           if (i % 5 == 0) {%>
            <tr>
            <!-- 새로운 행 시작 -->
      <%}
           %>
            <td>
            <a shopnum=<%=dto.getShopnum() %> style="cursor: pointer;" class="godetail">
            <img alt="" src="shopsave/<%=photo%>" class="photo">
            </a>
            
            <br> <%=dto.getSangpum()%><br> 
            
            <b style="color: red; font-size: 1.2em;"><%=sale%>%</b> 
            <span style="float: right;">
            
            <div style="color: gray; font-size: 13px;">
               <%
                      int price = (int) (dto.getPrice() - (dto.getPrice()) * (sale / 100.0));
                    %>
                  <%=nf.format(price)%>
            </div>
            
            <div style="color: black; font-size: 16px;">
               <strike><%=nf.format(dto.getPrice())%></strike>
            </div>
            
            </span>
            
            </td>
               
               <%
                 if (i % 5 == 4) {
                 %>
                  </tr>
                  <!-- 행 종료 -->
               <%
                 }
                 %>
                 
                <%
                 i++;
             }
                 }
       
                 %>
               </table></p>
            </div>
         </div>
      </div>
</body>
</html>