<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bean" class="pack.member.MemberBean" />
    <jsp:setProperty property="*" name="bean"/>
    <jsp:useBean id="memberManager" class="pack.member.MemberManager" />
    
    <%
    request.setCharacterEncoding("utf-8");  
    
    boolean b = memberManager.memberUpdate(bean, bean.getId());
    
    if (b) {
       %>
           <script>
               alert("회원 정보가 수정되었습니다.");
               location.href = "membermanager.jsp";
           </script>
       <%
           } else {
       %>
           <script>
               alert("수정 실패. 관리자에게 문의해주세요.");
               history.back();
           </script>
       <%
           }
       %>
