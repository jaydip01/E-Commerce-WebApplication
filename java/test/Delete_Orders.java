package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/deletecolection")
public class Delete_Orders extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if (hs == null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Home.html").forward(req, res);
		} else {
			int k = new Delete_Order_DAO().delete();
			if (k > 0) {
				req.setAttribute("msg", "Order Deleted Successfull...!");
			}
			req.getRequestDispatcher("View_Collection_After_Delete.jsp").forward(req, res);
		}
	}
}