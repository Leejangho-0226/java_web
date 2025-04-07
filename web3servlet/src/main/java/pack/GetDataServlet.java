package pack;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/GetDataServlet") // 요청명 : '/GetDataServlet'을 GetDataServlet.java와 매핑
public class GetDataServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청 처리 전용 메소드
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println(name + " " + age); // 개발자를 위한 코드
		// doGet를 doPost로 쓰면 HTTP 상태 405 – 허용되지 않는 메소드
		
		
		// 클라이언트로 전송할 코드 작성
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h3>서버가 전송한 자료 결과 확인(get)</h3>");
		out.println(name + "님의 나이는 " + age);
		out.println(calcAge(age)); // 사용자 작성 메소드 호출
		out.println("<br><br><a href='GetData.html'>자료 다시 입력</a>");
		out.println("</body></html>");
		out.close();
	}

	private String calcAge(String age) {
		int imsi = Integer.parseInt(age) / 10 * 10;
		String result = "";
		switch (imsi) {
		case 20: result = "이십대"; break;
		case 30: result = "삼십대"; break;
		case 40: result = "사십대"; break;
		default: result = "기타";
		}
		return result;
	}
}
