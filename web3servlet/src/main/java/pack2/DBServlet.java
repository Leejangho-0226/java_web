package pack2;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;


@WebServlet("/DBServlet")
public class DBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","123");
			pstmt = conn.prepareStatement("select * from sangdata");
		} catch (Exception e) {
			System.out.println("init err : " + e);
		}
	}

	
	public void destroy() {
		try {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h2>* 상품 정보 (서블릿) *</h2>");
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				out.println(rs.getString("code") + " " +
						rs.getString("sang") + " " +
						rs.getString("su") + " "  +
						rs.getString("dan") + "<br>");
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		
		}
		out.println("</body></html>");
		out.close();
	}

}
