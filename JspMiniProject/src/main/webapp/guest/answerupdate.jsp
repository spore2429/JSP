<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idx=request.getParameter("idx");
	String content=request.getParameter("content");
	
	AnswerDao dao=new AnswerDao();
	dao.updateAnswer(idx, content);
%>