<%@page import="db.memo.MemoDto"%>
<%@page import="db.memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemoDao dao=new MemoDao();
	
	//엔코딩
	request.setCharacterEncoding("utf-8");
	
	String writer=request.getParameter("uwriter");
	String story=request.getParameter("ustory");
	String avata=request.getParameter("uavata");
	String num=request.getParameter("unum");
	
	MemoDto dto=new MemoDto();
	dto.setWriter(writer);
	dto.setStory(story);
	dto.setAvata(avata);
	dto.setNum(num);
	
	dao.updateMemo(dto);
%>