package test;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserBean ub = new LoginDAO().login(req);

		if (ub == null) {
			req.setAttribute("msg", "Invalid Login Process");
			RequestDispatcher rd = req.getRequestDispatcher("Invalid.jsp");
			rd.forward(req, res);
		} else {
			ServletContext sct = req.getServletContext();
			
			//Cookie c[] = req.getCookies();
			
			sct.setAttribute("ubean2", ub);
			Cookie ck = new Cookie("fname", ub.getfName());
			res.addCookie(ck);
			
		  //String value = c[0].getValue();
		 //req.setAttribute("firstName", value);
			
            ArrayList<ProductBean> al = new ViewAllProductsDAO().retrieve();
			
		//	String value = c[0].getValue();
			HttpSession hs = req.getSession(true);
			hs.setAttribute("al2", al);
		//	req.setAttribute("fName", value);
			RequestDispatcher rd = req.getRequestDispatcher("Customer_ViewAllProducts.jsp");
			rd.forward(req, res);
		}

	}
}
