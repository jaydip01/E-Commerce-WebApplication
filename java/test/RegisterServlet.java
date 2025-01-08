package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/reg1")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserBean ub = new UserBean();
		
		ub.setuName(req.getParameter("uname"));
		ub.setpWord(req.getParameter("pass"));
		ub.setfName(req.getParameter("fname"));
		ub.setlName(req.getParameter("lname"));
		ub.setAddr(req.getParameter("addr"));
		ub.setmId(req.getParameter("mail"));
		ub.setPhNo(Long.parseLong(req.getParameter("phone")));
		
		int k = new RegisterDAO().register(ub);
		if(k>0) {
			
		req.setAttribute("msg","Registration process Successfull");
		RequestDispatcher rd = req.getRequestDispatcher("RegSuccess.jsp");
		rd.forward(req, res);
		}
	}

}
