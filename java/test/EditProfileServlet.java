package test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@SuppressWarnings("serial")
@WebServlet("/edit1")
public class EditProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if(c==null) {
			req.setAttribute("msg","Session Expired..<br>");
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req, res);
			}else {
			String value = c[0].getValue();
			req.setAttribute("fName", value);
			req.setAttribute("msg", "Profile Updateded Successfully");
			RequestDispatcher rd = req.getRequestDispatcher("EditProfile.jsp");

			rd.forward(req, res);
			}
	}
}