<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
function check() {
	if(frm.id.value === "" || frm.pwd.value === ""){
		alert("자료를 입력하세요");
		return;
	}
	frm.submit();
}
</script>
</head>
<body>
<form action="adminlogin.jsp" name="frm" method="post">
<table>
	<tr>
		<td>
		<%
		String sessionValue = (String)session.getAttribute("adminOk");
		if(sessionValue != null){
		%>
			이미 로그인 했어요!<br><br>
			<a href="adminlogout.jsp">로그아웃</a>
		 	<a href="javascript:window.close()">창닫기</a>	
		<% 	
		}else{
		%>	
			<table>
				<tr>
					<td>아이디 : <input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호 : <input type="text" name="pwd"></td>
				</tr>
				<tr>
				 <td>				
					<a href="#" onclick="check()">로그인</a>
		 			<a href="javascript:window.close()">창닫기</a>	
				 </td>
				</tr>
			</table>
		<% 
		}
		%>
		</td>
	</tr>	
</table>
</form>
</body>
</html>