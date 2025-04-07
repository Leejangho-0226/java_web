<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 내장 객체 사용 *</h2>
<%
request.setCharacterEncoding("utf-8"); // request : 클라이언트의 http 요청정보 수신
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(!(id.equals("aa") && pwd.equals("11"))){
	response.sendRedirect("jspex4object.jsp"); // response : HTTP 요청에 대한 응답정보 처리
}
%>

입력된 회원 정보 출력<br>
아이디는 <% out.println(id + "<br>"); %> <%-- out : 응답 페이지에 자료 전송을 위한 출력 객체 --%>
<hr>
protocol : <%= request.getProtocol() %><br>
Server buffer size : <%= response.getBufferSize() %><br>

Context path : <%= application.getContextPath() %><br> <%--동일한 Application의 Context 정보를 저장하고 있는 객체 --%>
Session : <%= pageContext.getSession() %> <%-- 응답 페이지 실행에 필요한 Context 정보를 저장한 객체 --%>

</body>
</html>