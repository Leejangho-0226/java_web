<%@page import="pack.Student"%>
<%@page import="pack.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
전통 : 안녕! <%= request.getAttribute("irum") %> <br>
EL : 안녕! ${requestScope.irum} ${irum}<br>

전통 : <% 
	Person p = (Person)request.getAttribute("person"); 
	out.println(p.getName());	
	%><br>
EL : ${person.name}<br>

전통 : <% 
	Student s = (Student)request.getAttribute("student"); 
	out.println(s.getAge());	
	%><br>
EL : ${student.age}<br>
<hr>
동물의 종류 : ${animal[0]}, ${animal[1]}, ${animal["2"]}
<c:if test="${list != null}">
	<c:forEach var="a" items="${list}">
		${a[0]},${a[1]},${a[2]}
	</c:forEach>
</c:if>
<br>
<c:if test="${list != null}">
	<c:forEach var="a" items="${list}">
		<c:forEach var="b" items="${a}">
			${b}
		</c:forEach>
	</c:forEach>
</c:if>
<br>
<c:choose>
	<c:when test="${list eq null}">list 자료 없음</c:when>
	<c:otherwise>list 자료 있어요</c:otherwise>
</c:choose>
<hr>
예외 처리 : try ~ catch 블럭<br>
<c:catch var="myErr">
<% int a = 10 / 3; out.println(a); %>
</c:catch>
<c:if test="${myErr != nill}">
	에러 발생 : ${myErr.message}
</c:if>
<br>다른 문서 포함<br>
include 지시어 사용 : <%@ include file="poham.jsp" %><br>
jsp action tag 사용 : <jsp:include page="poham.jsp"></jsp:include><br>
jstl 사용 : <c:import url="poham.jsp"></c:import>
<br>
<c:import url="https://www.daum.net" />
</body>
</html>