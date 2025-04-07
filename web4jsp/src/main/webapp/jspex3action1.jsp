<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
홀수 출력 : 
<%
for(int a = 1; a <= 10; a++){
	if(a % 2 == 1) out.print(a + " ");
}
%>
<br>