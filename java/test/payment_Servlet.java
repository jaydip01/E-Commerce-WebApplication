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

import test.UpdateProductDAO;
import test.ProductBean;

@WebServlet("/payment")
@SuppressWarnings("serial")
public class payment_Servlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		HttpSession hs = req.getSession(false);
		if (c == null) {
			req.setAttribute("msg", "Invalid Login Process ...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			String pCode = req.getParameter("code");
			int qty=Integer.parseInt(req.getParameter("reqqty"));
			ArrayList<ProductBean> al = (ArrayList<ProductBean>) hs.getAttribute("al2");

			Iterator<ProductBean> it = al.iterator();
			while (it.hasNext()) {
				ProductBean pb = (ProductBean) it.next();
				if (pCode.equals(pb.getpCode())) {
					req.setAttribute("pb2", pb);
					int q=pb.getpQty();
					pb.setpQty(q-qty);
					int i= new Admin_Cart().insert(pb,req);
					int k = new UpdateProductDAO().update(pb);
					if (k > 0) {
						
						req.setAttribute("msg", "Orderd Done Successfully....!");
						req.getRequestDispatcher("Captcha_Verify.jsp").forward(req, res);
						break;
					}
				}

			}
		}
	}
}