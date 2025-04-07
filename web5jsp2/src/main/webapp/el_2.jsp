<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>EL 연산자와 내장객체</h2>
--- 연산자 연습 ---<br>
\${3 + 4} ==> ${3 + 4}<br>
\${5 / 4} ==> ${5 / 4} <!-- ${5 div 4} --><br>
\${5 / 0} ==> ${5 / 0} <!-- ${5 div 0} --><br>
\${5 % 4} ==> ${5 % 4} ${5 mod 4}<br>

\${5 > 4} ==> ${5 > 4} ${5 gt 4}<br>
\${5 <= 4} ==> ${5 <= 4} ${5 le 4}<br>

\${5 >= 4 and 3 < 2} ==> ${5 >= 4 and 3 < 2}<br>
\${5 >= 4 or 3 < 2} ==> ${5 >= 4 or 3 < 2}<br>

\${5 >= 4?10:5+20} ==> ${5 >= 4?10:5+20}<br>
<hr>
----- 내장객체 ----<br/>
<%
request.setAttribute("aa", "air");
session.setAttribute("bb", "burger");
application.setAttribute("cc", "cat");
%>
* 생존 범위 관련 내장객체 값 출력 *<br>
jsp : <%=request.getAttribute("aa") %> EL : ${requestScope.aa} ${aa}<br>
jsp : <%=session.getAttribute("bb") %> EL : ${sessionScope.bb}<br>
jsp : <%=application.getAttribute("cc") %> EL : ${applicationScope.cc}<br>
<br>
jsp로 header : <%= request.getHeader("host") %><br>
EL로 header : ${header.host}, ${header["host"]}
<br>
* Collection 객체 값 처리 *<br>
<%
ArrayList<String> list = new ArrayList<>();
list.add("치즈버거");
list.add("치킨버거");
list.add("불고기버거");
request.setAttribute("foodlist", list); // foodlist라는 키로 list를 저장

ArrayList<String> list2 = new ArrayList<>();
list2 = (ArrayList)request.getAttribute("foodlist");
out.println("jsp로 출력 : " + list2.get(0));
out.println("jsp로 출력 : " + list2.get(1));
%>
<br>
EL로 출력 : ${foodlist[0]}, ${foodlist[1]}, ${foodlist["2"]}
<hr>
-- HTML 문서의 자료 받기 --<br>
<a href="el_2.html">el_2 호출</a>
jsp로 이름 : 
<%
String irum = request.getParameter("irum");
if (irum != null){
	out.print(irum);
}
%>
<br>
<%
String[] sungs = request.getParameterValues("sung"); 
if(sungs != null){
	for(String s : sungs){
		out.print(s + "");
	}
}
%>
<br>
EL로 이름 : ${param.irum}, ${param["irum"]}<br>
${paramValues.sung[0]} ${paramValues.sung["1"]} 
</body>
</html>