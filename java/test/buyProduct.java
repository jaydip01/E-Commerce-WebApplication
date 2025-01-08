package test;

import java.io.*;
import java.util.*;
import javax.servlet.*;

import javax.servlet.http.*;

import test.ProductBean;

import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/buyProduct")
public class buyProduct extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Invalid Login Process ...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			String pCode = req.getParameter("pcode");
			HttpSession hs = req.getSession(false);
			String value = c[0].getValue();
			req.setAttribute("fName", value);
			ArrayList<ProductBean> al = (ArrayList<ProductBean>) hs.getAttribute("al2");

			Iterator<ProductBean> it = al.iterator();
			
			while (it.hasNext()) {
				ProductBean pb = (ProductBean) it.next();
				if (pCode.equals(pb.getpCode())) {
					req.setAttribute("pb2", pb);
					break;
				}
			} // end of loop
			req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
		}
	}
}