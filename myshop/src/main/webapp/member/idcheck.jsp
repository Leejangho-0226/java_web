<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberManager" class="pack.member.MemberManager" />   

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
boolean b = memberManager.idCheckProcess(id);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body style="text-align: center;margin-top: 30px">
<h2><%=id %></h2>
<%
if(b){
%>
	이미 사용 중인 id입니다. 다른 id를 입력하세yo<br><br>
	<a href="#" onclick="opener.regForm.id.focus();window.close()">닫기</a>
<% 	
}else{
%>
	사용이 가능한 id 입니다.<br><br>
	<a href="#" onclick="opener.regForm.passwd.focus();window.close()">닫기</a>
<%	
}
%>
</body>
</html>