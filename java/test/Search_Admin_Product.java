package test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/search1")
public class Search_Admin_Product extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			ArrayList<ProductBean> al = new Search_DAO().retrieve(req);
			
			String value = c[0].getValue();
			HttpSession hs = req.getSession(true);
			hs.setAttribute("al3", al);
			req.setAttribute("fName", value);
			RequestDispatcher rd = req.getRequestDispatcher("AdminViewAllProducts.jsp");

			rd.forward(req, res);
		}

	}
}