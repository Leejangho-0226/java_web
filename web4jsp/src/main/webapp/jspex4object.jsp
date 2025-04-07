<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>9개의 내장객체</title>
</head>
<body>
<h2>* 9개의 내장객체 *</h2>
<pre><strong>
1. request
타입: javax.servlet.ServletRequest (또는 javax.servlet.http.HttpRequest)
역할: 클라이언트의 HTTP 요청 정보를 저장하고 있는 객체

2. response
타입: javax.servlet.ServletResponse (또는 javax.servlet.http.HttpResponse)
역할: HTTP 요청에 대한 응답 정보를 저장하는 객체

3. session
타입: javax.servlet.http.HttpSession
역할: 클라이언트가 서버에 접속했을 때 세션 정보를 저장한 객체

4. pageContext
타입: javax.servlet.jsp.PageContext
역할: 응답 페이지 실행에 필요한 Context 정보를 저장한 객체

5. out
타입: javax.servlet.jsp.JspWriter
역할: 응답 페이지 전송을 위한 출력 스트림

6. application
타입: javax.servlet.ServletContext
역할: 동일한 Application의 Context 정보를 저장하고 있는 객체

7. config (설정 관련)
타입: javax.servlet.ServletConfig
역할: 특정 페이지의 서블릿 설정 정보를 저장하고 있는 객체

8. page
타입: java.lang.Object
역할: 특정 페이지의 서블릿 객체(인스턴스화된 객체)

9. exception
타입: java.lang.Throwable
역할: 예외 처리를 위한 객체
</pre>
<br>
* 회원 가입 *<br/>
<form action="jspex4etc.jsp" method="post" name="frmMem">
아 이 디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pwd"><br>
<input type="submit" value="전송">
</strong>
</form>
</body>
</html>