package test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/update1")

public class UpdateProfileServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
		} else {
			String value = c[0].getValue();
			req.setAttribute("fName", value);
			ServletContext sct = req.getServletContext();
			UserBean ub = (UserBean) sct.getAttribute("ubean2");
			ub.setAddr(req.getParameter("addr"));
			ub.setmId(req.getParameter("mid"));
			ub.setPhNo(Long.parseLong(req.getParameter("phno")));
			int k = new UpdateProfileDAO().update(ub);
			if (k > 0) {
				req.setAttribute("msg", "Profile Updated Successfully");
				RequestDispatcher rd =

						req.getRequestDispatcher("CustEditProfile.jsp");

				rd.forward(req, res);

			}
		}
	}
}