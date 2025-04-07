<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardManager" class="pack.board.BoardManager" scope="page" />  
<jsp:useBean id="dto" class="pack.board.BoardDto" />  

<%
String num = request.getParameter("num");
String bpage = request.getParameter("page");
//out.print(num + " " + bpage); // 레코드와 페이지 번호가 넘어감

boardManager.updateReadcnt(num); // 조회수 증가
dto = boardManager.getData(num); // 해당 자료 읽기

// out.print(dto.getNum() + " " + dto.getName() + " " + dto.getTitle());

String apass = "*****"; // 일반 사용자는 비밀번호 보이지 않기
String adminOk = (String)session.getAttribute("adminOk"); // 세션에서 adminOk라는 키의 값을 읽음
if(adminOk != null){
	if(adminOk.equals("admin")) apass = dto.getPass(); // 키 값이 admin인 경우 비밀번호를 치환
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css"> <!-- css 먼저 하고 js한다 -->
</head>
<body>
<table>
	<tr>
		<td><b>비밀번호 : <%=apass %></b></td>
		<td colspan="2" style="text-align: right">
			<a href="reply.jsp?num=<%=dto.getNum() %>&page=<%=bpage %>"><!-- 원글의 정보를 가지고 감 -->
				<img src="../images/reply.gif">
			</a> 
				<a href="edit.jsp?num=<%=dto.getNum() %>&page=<%=bpage %>">
				<img src="../images/edit.gif">
			</a>  
				<a href="delete.jsp?num=<%=dto.getNum() %>&page=<%=bpage %>">
				<img src="../images/del.gif">
			</a>  
				<a href="boardlist.jsp?page=<%=bpage %>">
				<img src="../images/list.gif">
			</a>   
			
	
		</td>
	</tr>
	<tr style="height: 30">
	<td>
		작성자 : <a href="mailto:<%=dto.getMail() %>"><%=dto.getName() %></a>(ip : <%=dto.getBip() %>)
	</td>
	<td>작성일 : <%=dto.getBdate() %></td>
	<td>조회수 : <%=dto.getReadcnt() %></td>
	</tr>
	<tr>
		<td colspan="3" style="background-color: cyan">제목 : <%=dto.getTitle() %></td>
	</tr>
	<tr>
		<td colspan="3">
			<textarea rows="10" style="width: 99%" readonly="readonly"><%=dto.getCont() %></textarea>
	</tr>
</table>
</body>
</html>