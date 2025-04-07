<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnAdminLogin").onclick = funcAdminLogin;
	document.getElementById("btnHome").onclick = funcAdminHome;
}

</script>
</head>
<body>
<form action="adminloginproc.jsp" name="adminloginForm" method="post">
<table style="width: 300">
	<tr>
	  <td colspan="2">
	  		<h2>* 관리자 로그인 *</h2>
	  </td>
	</tr>
	<tr>
		<td>id</td>
		<td><input type="text" name="admin_id"></td>
	</tr>
	<tr>
		<td>password</td>
		<td><input type="text" name="admin_passwd"></td>
	</tr>
	<tr>
	  <td colspan="2">
	  		<input type="button" value="관리자 로그인" id="btnAdminLogin">
	  		<input type="button" value="메인 홈페이지" id="btnHome">
	  </td>
	</tr>
</table>
</form>
</body>
</html>