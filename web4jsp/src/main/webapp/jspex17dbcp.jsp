<%@page import="pack.GuestBookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dbConnGb" class="pack.DbConnGb" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function funcUp(code){
	if(code !== "" && code !== null){
	location.href="jspex17sujung.jsp?code=" + code;
	}
}

function funcDel(code){
	if(code !== "" && code !== null){
        if(confirm("정말 삭제할까요?")){
            location.href="jspex17del.jsp?code=" + code;            
        }       
    }
}
</script>
</head>
<body>
<h2>[ 방 명 록 ]</h2>
	<a href="jspex17insert.html">글쓰기</a>
	<br><br>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
	<%
	ArrayList<GuestBookDto> slist = dbConnGb.getDataAll();

		for(GuestBookDto dto:slist){
	%>
	<tr>
		<td><a href="javascript:funcDel('<%= dto.getCode() %>')"><%= dto.getCode() %></a></td>
		<td><a href="javascript:funcUp('<%= dto.getCode() %>')"><%= dto.getWriter() %></a></td>
		<td><%= dto.getTitle() %></td>
		<td><%= dto.getContents() %></td>
	</tr>
	<%
	}
	%>
		
</table>
</body>
</html>