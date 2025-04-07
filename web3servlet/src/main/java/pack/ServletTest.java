package pack;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;


@WebServlet(urlPatterns = {"/ServletTest", "/kbs.mbc", "/good"}) // 여러개 할때 배열로 
public class ServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int su = 0; // 멤버필드(전역변수)
    ServletTest2 test2;
    
    public ServletTest() {
        super();
        System.out.println("서블릿 생명 주기(lifecycle) : 1 - ServletTest()");
        
    }

	
	public void init(ServletConfig config) throws ServletException {
		// 서블릿 파일 요청 시 최초 1회만 수행 : 초기화 담당
		test2 = new ServletTest2("홍길동");
		
		System.out.println("서블릿 생명 주기(lifecycle) : 2 - init");
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get, post 요청 모두를 받아 처리함
		response.setContentType("text/html;charset=utf-8"); 
		su++; // 전역변수이기 때문에 서비스를 만날때마다 늘어남
		int a = 10, b = 20; // 지역변수

		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>서블릿의 멤버 확인</h2>");
		out.println("su : " + su + "<br>");
		out.println("a : " + a + ", b : " + b + "<br>");
		
		int result = calcData(a, b); // 메소드 호출
		out.println("클라이언트 컴으로 계산 결과 : " + result);
		System.out.println("이렇게 적으면 서버 컴의 출력장치로 출력 계산 결과 : " + result);
		
		
		// 별도 작성한 클래스 멤버 호출
		// ServletTest2 test2 = new ServletTest2("홍길동"); // 객체가 요청할 때마다 생성되므로 메모리 낭비가 심하다, 1회만 수행되도록 해야함 => 싱글톤
		out.println("<br>이름은 " + test2.getIrum());
		
		out.println("현재 년 : " + Calendar.getInstance().get(Calendar.YEAR)); // singleton
		
		
		out.println("</body></html>");
		out.close();
		
		// 클라이언트의 요청 시 스레드가 만들어진 후 socket 통신을 한다
		String threadName = Thread.currentThread().getName();
		System.out.println("현재 실행 중인 스레드명 : " + threadName);
		System.out.println("socket으로 클라이언트 ip addr : " + request.getRemoteAddr());
		System.out.println("socket으로 클라이언트 port : " + request.getRemotePort());
	
		System.out.println("서블릿 생명 주기(lifecycle) : 3 - service");
		doGet(request, response);
		doPost(request, response);
	
	}
	
	
	private int calcData(int num1, int num2) { // 사용자가 작성한 class의 멤버 메소드
		return num1 + num2;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get 요청 처리 메소드 : service 보다 우선순위가 낮다
		System.out.println("서블릿 생명 주기(lifecycle) : 4 - doGet");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post 요청 처리 메소드 : service 보다 우선순위가 낮다
		System.out.println("서블릿 생명 주기(lifecycle) : 4 - doPost");
	}
	
	@Override
	public void destroy() {  
		// 웹 서버 서비스가 종료되면 수행  
		System.out.println("서블릿 생명 주기(lifecycle) : 5 - destroy");
	}

}
