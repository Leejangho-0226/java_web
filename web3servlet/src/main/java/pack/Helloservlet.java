package pack;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/hello") // 논리적 요청으로 물리적 파일을 찾아감 // "/abc" : 논리적 요청 // "/abc" : 이름은 마음대로
public class Helloservlet extends HttpServlet { // Helloservlet : 물리적 파일
	
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	// doGet,doPost 보다 우선순위가 높음
	// request 다음에 response 순서 지켜야함 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 성공"); // 서버
		
		response.setContentType("text/html;charset=utf-8"); // Mime type과 문자코드 설정
		// MIME TYPE은 인터넷에서 전송되는 다양한 종류의 데이터를 식별하기 위한 형식

		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>안녕하세요.서블릿 세상입니다</h2>");
		out.println("</body></html>");
		out.close();  // 클라이언트 브라우저로 전송
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
