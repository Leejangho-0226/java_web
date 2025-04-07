<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.board.BoardBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="boardManager" class="pack.board.BoardManager" />

<%
String bpage = request.getParameter("page"); // page는 못받아서 이렇게 처리함

// 폼빈 내용 일부 채우기
int num = bean.getNum();
int gnum = bean.getGnum();
int onum = bean.getOnum() + 1; 		// 댓글이므로 1 증가
int nested = bean.getNested() + 1;

boardManager.updateOnum(gnum, onum); // onum 갱신
bean.setOnum(onum);
bean.setNested(nested);
bean.setBip(request.getRemoteAddr());
bean.setBdate();
bean.setNum(boardManager.currentMaxNum() + 1);


boardManager.saveReplyData(bean); 

response.sendRedirect("boardlist.jsp?page=" + bpage); // 댓글 추가 후 목록보기

%>