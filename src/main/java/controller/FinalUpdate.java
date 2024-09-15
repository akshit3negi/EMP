package controller;

import java.io.IOException;

import bean.Student;
import dao.StudentOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util_class.BCrypt;

@WebServlet("/FinalUpdate")
public class FinalUpdate extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("id") != null) {

			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password = BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt(12));
			String contact = request.getParameter("contact");
			int fees = Integer.parseInt(request.getParameter("fees"));
			String admission_date = request.getParameter("admission_date");
			String course = request.getParameter("course");
			Student st = new Student(name, username, password, address, contact, course, admission_date, fees);

			int id = Integer.parseInt(request.getParameter("id"));
			StudentOperations so = new StudentOperations();
			boolean update=so.update(id, st);
			if(update) {
				response.sendRedirect("AdminPanel/showAllStudent.jsp");
			} else {
				response.getWriter().println("Failed to update");
			}
		}
	}
}
