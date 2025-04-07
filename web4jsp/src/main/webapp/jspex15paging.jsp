<%@page import="pack.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dbConnPaging" class="pack.DbConnPaging" scope="page" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 정보(Beans - paging)</h2>
<a href="jspex15insert.html">상품 추가</a>
<br>
<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>	
<%
// 페이지 번호를 받아 해당 페이지 자료만 출력
String pa = request.getParameter("page");
if(pa == null) pa = "1";


ArrayList<SangpumDto> list = dbConnPaging.getDataAll(pa);
for(int i=0; i < list.size(); i++){
	SangpumDto dto = (SangpumDto)list.get(i);
%>
	<tr>
		<td><%= dto.getCode() %></td>
		<td><%= dto.getSang() %></td>
		<td><%= dto.getSu() %></td>
		<td><%= dto.getDan() %></td>
	</tr>	
<%	
	// dbConnPaging.prepareTotalPage(); // 전체 페이지 수 구하기
}
%>	
	<tr>
		<td colspan="4" style="text-align: center;">
		<%
		if(dbConnPaging.prepareTotalPage() > 0){
			for(int pageNo = 1; pageNo <= dbConnPaging.prepareTotalPage(); pageNo++){
		%>
			<a href="jspex15paging.jsp?page=<%= pageNo %>"><%= pageNo %></a>&nbsp;
		<%
				
			}
		}
		%>
		</td>
	</tr>

</table>
</body>
</html>