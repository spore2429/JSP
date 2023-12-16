<%@page import="db.ajaxboard.AjaxBoardDao"%>
<%@page import="db.ajaxboard.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String story=request.getParameter("ustory");
	String avata=request.getParameter("uavata");
	String num=request.getParameter("unum");
	
	AjaxBoardDto dto=new AjaxBoardDto();
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setStory(story);
	dto.setAvata(avata);
	dto.setNum(num);
	
	AjaxBoardDao dao=new AjaxBoardDao();
	dao.updateAjaxBoard(dto);
%>
