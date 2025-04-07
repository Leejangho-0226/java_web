package pack;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> products = new ArrayList<Product>();
		
		products.add(new Product("볼펜", 1500, "부드럽게 써짐", new Date()));
		products.add(new Product("연필", 1000, "그립감 좋음", new Date()));
		products.add(new Product("노트", 5500, "종이 품질이 우수하여 불빛에 반짝임 없이 매우 잘보임", new Date()));
		
		request.setAttribute("products", products);
		request.getRequestDispatcher("productshow.jsp").forward(request, response);
	}

}
