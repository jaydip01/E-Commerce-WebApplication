package test;

import java.io.*;
import java.util.*;
import javax.servlet.*;

import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/deleteProduct1")
public class DeleteProductServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if (hs == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Home.html").forward(req, res);
		} else {
			String pCode = req.getParameter("pcode");
			ArrayList<ProductBean> al = (ArrayList<ProductBean>) hs.getAttribute("al3");

			Iterator<ProductBean> it = al.iterator();
			while (it.hasNext()) {
				ProductBean pb = (ProductBean) it.next();
				if (pCode.equals(pb.getpCode())) {
					it.remove();
					break;

				}
			} // end of loop
			int k = new DeleteProductDAO().delete(pCode);
			if (k > 0) {
				req.setAttribute("msg3", "Product Deleted Successfully");
			}
			req.getRequestDispatcher("DeleteProduct.jsp").forward(req, res);
		}
	}
}