<%@page import="pack.member.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-회원관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<h2>* 관리자-전체회원관리 *</h2>
<%@include file="admin_top.jsp" %>

<table style="width: 95%">
	<tr style="background-color: blue; color: white;">
	  <th>아이디</th><th>고객명</th><th>이메일</th><th>전화번호</th><th>수정</th>
	</tr>
	<%
	ArrayList<MemberDto> list = memberManager.getMemberAll();
	for(MemberDto m:list){
	%>
	<tr>
	  <td><%=m.getId() %></td>
	  <td><%=m.getName() %></td>
	  <td><%=m.getEmail() %></td>
	  <td><%=m.getPhone() %></td>
	  <td>
	  		<a href="javascript:memberUpdate('<%=m.getId() %>')" >수정하기></a>
	  </td>
	</tr>
	<%
	}
	%>
</table>

<%@include file="admin_bottom.jsp" %>

<form action="memberupdate_admin.jsp" name="updateFrm" method="post">
	<input type="hidden" name="id">
</form>
</body>
</html>