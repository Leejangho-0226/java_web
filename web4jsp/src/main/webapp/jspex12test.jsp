<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="formBean" class="pack.Jspex12TestBean" ></jsp:useBean>
<jsp:setProperty property="*" name="formBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="Logic" class="pack.Jspex12Logic" />
<jsp:setProperty property="formBean" name="Logic" value="<%=formBean %>"/>
정가 : <jsp:getProperty property="jung" name="formBean"/>
할인 : <jsp:getProperty property="hal" name="formBean"/>

</body>
</html>