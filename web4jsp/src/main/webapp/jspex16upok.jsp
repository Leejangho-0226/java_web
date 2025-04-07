<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>  

<jsp:useBean id="formBean" class="pack.SangpumFormBean" />  
<jsp:setProperty property="*" name="formBean"/>
<jsp:useBean id="dbConnPooLing" class="pack.DbConnPooling" />

<%
// boolean b = dbConnPooLing.updateData(formBean);

if(dbConnPooLing.updateData(formBean))
	response.sendRedirect("jspex16dbcp.jsp"); // 수정 후 목록보기
else
	response.sendRedirect("jspex16fail.html"); // 수정 실패시 이동 페이지
%>