package test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/addProduct1")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession hs = req.getSession(false);
		if (hs == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {

			ProductBean pb = new ProductBean();

			/*pb.setpCode(req.getParameter("code"));
			pb.setpName(req.getParameter("name"));
			pb.setpPrice(Float.parseFloat(req.getParameter("price")));
			pb.setpQty(Integer.parseInt(req.getParameter("qty")));
			//pb.setBase64(req.getParameter("image"));*/

			int k = new AddProductDAO().insert(pb,req);
			if (k > 0) {
				req.setAttribute("msg", "Product Added Successfully");

				RequestDispatcher rd = req.getRequestDispatcher("AddProduct.jsp");
				rd.forward(req, res);
			}
		}

	}
}