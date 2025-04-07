<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃이란 세션을 삭제. 그리고 로그인 화면으로 이동하면 깔끔
//session.invalidate(); // 클라이언트가 가진 모든 세션 내의 키를 삭제
session.removeAttribute("userid"); // 클라이언트가 가진 세션 내의 특정 키를 삭제

response.sendRedirect("jspex8login.html");
%>