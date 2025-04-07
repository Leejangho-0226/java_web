<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="formBean" class="pack.GuestBookformbean"/>
<jsp:setProperty property="*" name="formBean" />

<jsp:useBean id="dbConnGb" class="pack.DbConnGb"/>


<%

boolean b = dbConnGb.insertData(formBean);


if(b)
	response.sendRedirect("jspex17dbcp.jsp");
else
	response.sendRedirect("jspex17fail.html");
%>
