package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/billproduct")
@SuppressWarnings("serial")
public class ProductBillServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Invalid Login Process ...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			String pCode = req.getParameter("pcode");
			int qty = Integer.parseInt(req.getParameter("reqqty"));
			HttpSession hs = req.getSession(false);
			String value = c[0].getValue();
			req.setAttribute("fName", value);
			ArrayList<ProductBean> al = (ArrayList<ProductBean>) hs.getAttribute("al2");

			Iterator<ProductBean> it = al.iterator();
			while (it.hasNext()) {
				ProductBean pb = (ProductBean) it.next();
				if (pCode.equals(pb.getpCode())) {
					req.setAttribute("pb2", pb);
					req.setAttribute("qty",qty);
					break;
				}
			} // end of loop
			req.getRequestDispatcher("BillProduct.jsp").forward(req, res);
		}
	}
}
