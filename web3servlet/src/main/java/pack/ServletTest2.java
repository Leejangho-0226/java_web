package pack;

import java.io.PrintWriter;

public class ServletTest2 { // ServletTest와 관련있는 일반 클래스
	private String irum;
	
	public ServletTest2(String irum) {
		System.out.println("ServletTest2 생성자");
		this.irum = irum;
	}

	public String getIrum() {
		return irum;
	}
	
	public void disp(int n, PrintWriter out) {
		out.println("<br>n	값 출력 : " + n);
	}
	
}
