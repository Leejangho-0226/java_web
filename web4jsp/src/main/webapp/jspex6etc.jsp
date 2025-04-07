<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//response.sendRedirect("WEB-INF/kbs.jsp"); // redirect 방식으로 호출

// forward 방식으로 호출
//RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/kbs.jsp");
//dispatcher.forward(request, response);
%>
<jsp:forward page="WEB-INF/kbs.jsp" />