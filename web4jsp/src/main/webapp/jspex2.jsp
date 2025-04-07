<%-- page 지시어 : 현재 문서의 속성이나 정보 등을 선언 또는 지시하는 역활 --%>
<%-- page 위에는 주석을 제외한 그 어떤것도 적지 않는다 --%>
<%-- import는 지시어안에 적어야 한다 --%>
<%-- errorPage : 에러 났을때 띄울 수 있는 화면 설정 에러페이지파일명.jsp --%>
<%@page import="java.time.ZoneId"%>
<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.time.LocalDate" 
import="java.sql.Connection, java.sql.ResultSet"
session="true"
buffer="8kb"
autoFlush="true"
isThreadSafe="true"
info="jsp문서정보 기록"

errorPage="jspex2err.jsp"
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>page 지시어</h2>
현재 날짜 : 
<%
LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul"));
out.println(now.getYear() + "년" + now.getMonthValue() + "월");
%>
<%= now.getDayOfMonth() + "일" %>
<hr>
<%= 10 / 0 %> <%-- 문법에러, 런타임에러(처음부터 0으로 나눈 경우) 등은 개발자가 수정한다 --%>
<%-- 하지만 정상적으로 작동하던 페이지가 예상치 못한 에러를 만난 경우는 별도의 화면을 제공해줘야 한다 --%>
</body>
</html>