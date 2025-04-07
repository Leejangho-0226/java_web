<%@ page import="java.util.Date"%>
<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='css/css.css'>
</head>
<body>
	<%-- 
* Element 의 종류
1) 지시어 : <%@ %> 
2) 선언 : <%! %> 전역변수(멤버필드) 및 메소드 선언
3) 식(표현) : <%= %> 클라이언트 값 전송
4) 스크립트릿(scriptlet) <% %> 자바 코드 작성
5) 액션 태그 : <jsp:/>
--%>
	<h2>JSP 문서 기본 이해</h2>
	<%
   // 자바 코드 작성 영역
   String irum = "이장호";
   out.println(irum + " 의 홈페이지 입니다."); // 내장객체 out 으로 브라우저에 메세지 출력

   for (int i = 1; i < 7; i++) {
      out.print("<h" + i + ">");   // <h1>...생성
      out.print("jsp 만세");
      out.println("</h" + i + ">"); // </h1>
   }
   %>
	여기는 html
	<br>
	<%
   Date date = new Date();
   out.println(date);
   %>
	<i><%= date %> </i>
	<%-- 표현식은 출력 내용 한 개만 적는다. 뒤에 ; 주지않음 --%>
	<%= new Date() %>
	<br>여기는 html
	<br>
	<%
  int a=0,sum=0;
  do{
	  a++;
	  sum += a;
  }while(a < 10);
  %>
	<%= "10까지의 합은 " + sum %>

	<br>
	<%= irum + "님의 전화번호는" + tel %>
	<%! // 선언 : 지역변수가 됨. 이외의 변수 선언은 지역변수!. 
   // 왜냐하면 jsp는 HttpServlet을 상속받은 클래스이며, 오버라이딩된 service 메소드 내에 코드를 작성한 문서
   String tel = "111-1111";
   %>
   
   <br>
   <%! // 클래스의 멤버 메소드 작성
   public int addMethod(int m, int n){
	   return m + n;
   }
   %>d
   <%= addMethod(4, 5) %>
</body>
</html>