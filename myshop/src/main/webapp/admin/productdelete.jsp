<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>

<%
request.setCharacterEncoding("utf-8");

String no = request.getParameter("no");

boolean result = productManager.deleteProduct(no);

if(result){
%>
<script>
   alert("정상 처리되었씁니다");
   location.href= "productmanager.jsp";
</script>
<%
}else{
   %>
   alert("오류 발생!\n관리자에게 문의 바람");
   location.href= "productmanager.jsp";
   <%
}
%>