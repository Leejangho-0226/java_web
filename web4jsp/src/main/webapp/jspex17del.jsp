<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = request.getParameter("code");
%>

<jsp:useBean id="dbConnGb" class="pack.DbConnGb"/>

<%
if(dbConnGb.deleteData(code))
	response.sendRedirect("jspex17dbcp.jsp");	// 업데이트 삭제 성공 후 상품 보기
else
	response.sendRedirect("jspex17fail.html");	// 삭제 실패 시 이동
%>