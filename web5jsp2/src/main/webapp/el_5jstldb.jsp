<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL의 sql을 사용해 상품자료 읽기</h2>
<c:catch var="dbErr">
<sql:setDataSource var="ds"
	url="jdbc:mariadb://Localhost:3306/test"
	driver="org.mariadb.jdbc.Driver"
	user="root"
	password="123"
/>

<sql:query var="rs" dataSource="${ds}">
	select * from sangdata where code >= ? and code <= ?
	<sql:param value="1" />
	<sql:param value="5" />
</sql:query>

<table border="1">
	<tr>
	  <th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>
	<c:forEach var="s" items="${rs.rows}">
	<tr>
		<td>${s.code}</td>
        <td>${s.sang}</td>
        <td>${s.su}개</td>
        <td>${s.dan}원</td>
	</tr>
	</c:forEach>
</table>

</c:catch>
<c:if test="${dbErr != null}">
 DB 처리 중 에러 발생 : ${dbErr.message}
</c:if>
</body>
</html>