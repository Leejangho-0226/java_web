<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="boardManager" class="pack.board.BoardManager" />

<%
String num = request.getParameter("num");
String bpage = request.getParameter("page");
String pass = request.getParameter("pass");


// 비밀번호 비교 후 수정 여부 결정 
boolean b = boardManager.checkPassword(Integer.parseInt(num), pass); // 비번 비교

if(b){
	boardManager.delData(num);
	response.sendRedirect("boardlist.jsp?page=" + bpage); // 삭제 후 목록보기
}else{
%>
	<script>
		alert("비밀번호 불일치!");
		history.back();
	</script>
<%	
}
%>