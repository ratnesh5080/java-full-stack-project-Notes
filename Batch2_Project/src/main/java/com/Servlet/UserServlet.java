package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")  //We call as URL 
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("fname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean f=dao.addUser(us);
		HttpSession session;
		
		//Use for the indication it is successfully is registered on registered.jsp
		if(f) {
			session=request.getSession();
			session.setAttribute("reg-sucess", "Registered Sucessfully");
			response.sendRedirect("register.jsp");
		}else {
			session=request.getSession();
			session.setAttribute("reg-failed", "Not Registered");
			response.sendRedirect("register.jsp");
		}
	}

}
