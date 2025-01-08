package test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if (c == null) {
			req.setAttribute("msg", "Session Expired...<br>");
		} else {
			ServletContext sct = req.getServletContext();
			sct.removeAttribute("ubean1");
			c[0].setMaxAge(0);
			res.addCookie(c[0]);
			req.setAttribute("msg4", "User LoggedOut Successfully");
		} // end of else
		RequestDispatcher rd = req.getRequestDispatcher("AfterLogOut.jsp");

		rd.forward(req, res);
	}
}
