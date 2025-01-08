package test;

import java.io.*;
import java.util.*;
import javax.servlet.*;

import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/viewProducts2")
public class AdminViewProduct extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if (hs == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			ArrayList<ProductBean> al = new ViewAllProductsDAO().retrieve();

			hs.setAttribute("al3", al);
			RequestDispatcher rd = req.getRequestDispatcher("AdminViewAllProducts.jsp");

			rd.forward(req, res);
		}

	}
}