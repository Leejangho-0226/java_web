<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
//String name = request.getParameter("name"); // 지금까지는 이렇게 함 이제 빈즈를 사용할거임 
%>   
<jsp:useBean id="formBean" class="pack.Jspex11FormBean" /> 
<%-- 낱개로 받는다 이렇게 --%>
<%-- 
<jsp:setProperty property="name" name="formBean" />
--%>
<jsp:setProperty property="*" name="formBean" /> <%-- 자동으로 모든 값이 setter를 통해 저장됨 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
폼빈의 저장된 자료 출력<br>
이름은 <jsp:getProperty property="name" name="formBean"/><br>
국어는 <jsp:getProperty property="kor" name="formBean"/><br>
영어는 <jsp:getProperty property="eng" name="formBean"/><br>
<%-- 계산을 위한 클래스를 Beans 사용 --%>

<jsp:useBean id="Logic" class="pack.Jspex11Logic" />
<jsp:setProperty property="formBean" name="Logic" value="<%=formBean %>"/>
총점은 <jsp:getProperty property="tot" name="Logic"/>
평균은 <jsp:getProperty property="avg" name="Logic"/>
</body>
</html>