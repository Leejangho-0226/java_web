<%@page import="pack.GuestBookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String code = request.getParameter("code");
    %>
<jsp:useBean id="dbConnGb" class="pack.DbConnGb" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
GuestBookDto dto = dbConnGb.updateDataRead(code);
if(dto == null){
%>
	<script type="text/javascript">
		alert("등록된 상품 코드가 아닙니다.");
		location.href="jspex17dbcp.jsp";
	</script>
<%
	return;
}
%>
* 방명록 수정 *<br>
<form action="jspex17update.jsp" method="post">
코드 : <%=dto.getCode() %>
<input type="hidden" name="code" value="<%=dto.getCode() %>">
<br>
작성자 : <input type="text" name="writer" value="<%=dto.getWriter()%>" ><br>
제 &nbsp;&nbsp;목 : <input type="text" name="title" value="<%=dto.getTitle()%>" ><br>
내 &nbsp;&nbsp;용 : <input type="text" name="contents" value="<%=dto.getContents()%>" ><br>

<input type="submit" value="방명록 수정">
<input type="button" value="수정 취소" onclick="javascript:location.href='jspec17dbcp.jsp'">

</form>
</body>
</html>