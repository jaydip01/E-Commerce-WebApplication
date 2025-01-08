package test;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/admin1")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminBean ab = new AdminLoginDAO().login(req);
		if (ab == null) {
			req.setAttribute("msg", "Invalid Login Process");
			RequestDispatcher rd = req.getRequestDispatcher("AdminInvalid.jsp");
			rd.forward(req, res);
		} else {
			HttpSession hs = req.getSession();
			hs.setAttribute("abean3", ab);
			ArrayList<ProductBean> al = new ViewAllProductsDAO().retrieve();

			hs.setAttribute("al3", al);
			RequestDispatcher rd = req.getRequestDispatcher("AdminViewAllProducts.jsp");

			rd.forward(req, res);
		}
	}
}