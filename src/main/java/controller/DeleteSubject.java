package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.SubjectDeclaration;
import dao.SubjectOperations;

@WebServlet("/DeleteSubject")
public class DeleteSubject extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		SubjectOperations so=new SubjectOperations();
		boolean b=so.delete(id);
		if(b)
			response.sendRedirect("AdminPanel/showAllSubject.jsp");
		else
			response.getWriter().println("Failed to delete!");
	}

}
