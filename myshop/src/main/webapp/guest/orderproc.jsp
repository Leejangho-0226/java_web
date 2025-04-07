<%@page import="java.util.Map"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니에 담긴 상품을 주문하기 --%>
<jsp:useBean id="cartManager" class="pack.order.CartManager" scope="session" />
<jsp:useBean id="orderManager" class="pack.order.OrderManager" />
<jsp:useBean id="productManager" class="pack.product.ProductManager" />

<%
Hashtable hCart = cartManager.getCartList();
Enumeration enu = hCart.keys();  // X  얘 대신에 Map.Entry 사용
//Hashtable<String, Object> hCart = cartManager.getCartList();

if(hCart.isEmpty()){
%>
   <script>
   alert("주문 내역이 없습니다");
   location.href="orderlist.jsp";
   </script>
<%   
}else{
   while(enu.hasMoreElements()){
   OrderBean orderBean = (OrderBean)hCart.get(enu.nextElement());   
   // 아래 두 실행문은 모두 성공하거나 모두 취소돼야 하므로 transaction 처리가 필요
      orderManager.insertOrder(orderBean);     // 주문 정보 DB에 저장
      productManager.reduceProduct(orderBean); // 주문 수량 만큼 재고량에서 빼기
      cartManager.deleteCart(orderBean);   
   }      
%>
   <script>
   alert("주문 처리가 잘 되었습니다.\n고객님 감사합니다");
   location.href="orderlist.jsp";
   </script>
<%
}
%>
}