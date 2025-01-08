package test;
import java.io.*;
import java.util.*;
import javax.servlet.*;

import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/cart")
public class Tot_Collection_Servlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			ArrayList<ProductBean> al5 = new Collection_DAO().retrieve();
			
			String value = c[0].getValue();
			HttpSession hs = req.getSession(true);
			hs.setAttribute("al5", al5);
			req.setAttribute("fName", value);
			RequestDispatcher rd = req.getRequestDispatcher("View_Collection.jsp");

			rd.forward(req, res);
		}

	}
}