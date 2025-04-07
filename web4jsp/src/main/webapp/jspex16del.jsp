<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String code = request.getParameter("code");
%>

<jsp:useBean id="dbConnPooLing" class="pack.DbConnPooling" />

<% 
if(dbConnPooLing.deleteData(code))
	response.sendRedirect("jspex16dbcp.jsp"); // 삭제 후 목록보기
else
	response.sendRedirect("jspex16fail.html"); // 삭제 실패시 이동 페이지
%>