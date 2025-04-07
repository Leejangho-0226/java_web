<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
jsp에 의해 호출된 파일임<br>
수신 자료 :
<%
//String data = request.getParameter("mydata");
//out.println("redirect" + data);

//호출하기 2인 경우 : forward
String data = (String)request.getAttribute("mydata");
out.println("forward " + data);

out.println("<br>길동이 출력 : ");
ArrayList<String> list = (ArrayList)request.getAttribute("listdata");
for(String ss:list){
	out.println(ss);
}
%>
</body>
</html>