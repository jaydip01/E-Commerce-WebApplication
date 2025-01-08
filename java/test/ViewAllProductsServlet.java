package test;

import java.io.*;
import java.util.*;
import javax.servlet.*;

import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/viewProducts1")
public class ViewAllProductsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			ArrayList<ProductBean> al = new ViewAllProductsDAO().retrieve();
			
			String value = c[0].getValue();
			HttpSession hs = req.getSession(true);
			hs.setAttribute("al2", al);
			req.setAttribute("fName", value);
			RequestDispatcher rd = req.getRequestDispatcher("Customer_ViewAllProducts.jsp");

			rd.forward(req, res);
		}

	}
}