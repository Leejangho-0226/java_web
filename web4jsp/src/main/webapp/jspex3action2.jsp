<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = request.getParameter("msg"); 
out.print("메세지는" + msg);
%>
<%= "메세지는 " + msg %>