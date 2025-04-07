<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String irum = request.getParameter("irum");
String nai = request.getParameter("nai");

System.out.println(irum + "님의 나이는 " + nai); // 서버컴에 출력
out.print(irum + "님의 나이는" + nai); // 클라이언트로 전송
%>