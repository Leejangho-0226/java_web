<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("adminOk"); // 'adminOk'라는 키 세션삭제 => 로그아웃
%>
<br><br>
<a href="javascript:window.close()">창닫기</a>
</body>
</html>