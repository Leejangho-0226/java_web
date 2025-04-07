<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바 영역
request.setCharacterEncoding("UTF-8");
String irum = request.getParameter("name");
String id = request.getParameter("id");
String email = request.getParameter("email");

System.out.println("자바 표준출력장치 : " + irum + " " + id + " " + email);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
console.log(`자바스크립트 표준출력장치 : <%=irum %>`);
</script>
</head>
<body>
이름은 <%=irum %><br>
아이디는<%=id %> 이메일은 <%=email %>
</body>
</html>