<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel='stylesheet' type='text/css' href='css/css.css'>
<%
String data = request.getParameter("data");
String msg = "mr. " + data;

// 1 : redirect 방식으로 다른 jsp 파일 호출
// response.sendRedirect("jspex6jsp2.jsp?mydata=" + msg);
%>
<%
// 2 : forward 방식으로 다른 jsp 파일 호출
request.setAttribute("mydata", msg);

ArrayList<String> list = new ArrayList<String>();
list.add("홍길동");
list.add("고길동");
list.add("신길동");
request.setAttribute("listdata", list); // jsp 파일 호출시 전송자료 하나 더

//RequestDispatcher dispatcher = request.getRequestDispatcher("jspex6jsp2.jsp");
//dispatcher.forward(request, response);
//참고 : jsp에서는 좀 더 간단한 방법 사용 가능 : jsp action tag를 사용하면 된다
%>
<jsp:forward page="jspex6jsp2.jsp"></jsp:forward>