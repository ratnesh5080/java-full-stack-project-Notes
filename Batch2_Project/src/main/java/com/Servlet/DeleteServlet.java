package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid=Integer.parseInt(request.getParameter("note_id"));
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.deleteNotes(pid);
		if(f) {
			System.out.println("Data Deleted Successfully");
			response.sendRedirect("showNotes.jsp");
		}
	}

}