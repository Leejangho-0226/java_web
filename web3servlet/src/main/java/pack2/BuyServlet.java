package pack2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(false);
		if(httpSession == null) return;
		
		ArrayList<Goods> glist = (ArrayList<Goods>)httpSession.getAttribute("list");
		if(glist == null) return;	
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<br><table width='80%' border='1'>");
		out.println("<tr><th>상품명</th><th>가격</th></tr>");
		
		int totPrice = 0;
		for(int i=0; i < glist.size(); i++) {
			Goods goods = glist.get(i); // 컬렉션에 저장된 상품자료(DTO) 한 개씩 꺼내서 출력
			out.println("<tr>");
			out.println("<td>" + goods.getName() + "</td>");
			out.println("<td>" + goods.getPrice() + "</td>");
			out.println("</tr>");
			totPrice += goods.getPrice(); // 가격을 누적
		}
		out.println("<tr><td colspan='2'>결재 총액 : " + totPrice + "</td></tr>");
		out.println("</table>");
		out.println("<br>고객님 결제해 주셔서 감사합니다!!");
		out.println("<br><a href='Shopping/shop.html'>새마음으로 쇼핑 시작</a>");
		out.println("</body></html>");
		out.close();

		// 결재가 끝났으므로 세션은 초기화
	//	httpSession.invalidate(); // 해당 고객의 세션내 모든 키 삭제
		httpSession.removeAttribute("list"); // 해당 고객의 세션내 특정 키 하나만 삭제
	}	

}
