<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>결과 보기</h2>
<%
request.setCharacterEncoding("utf-8");
String movie = request.getParameter("movie");

String id =(String)session.getAttribute("mykey"); // 세션 값 얻기

if(id != null){ // 세션이 유효
%>
	<%= id %>님이 좋아하는 영화는<%= movie %>입니다.<br>
	session id : <%= session.getId() %><br>
	session max time : <%= session.getMaxInactiveInterval() %>
<%	
}else{ // 세션 설정 안됨
	out.println("세션이 설정되지 않음");
}
%>
</body>
</html>