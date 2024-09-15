package controller;

import java.io.IOException;
import java.io.PrintWriter;

import bean.Student;
import dao.StudentDeclaration;
import dao.StudentOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util_class.BCrypt;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter writer=response.getWriter();

		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		password=BCrypt.hashpw(password, BCrypt.gensalt(12));
		String contact = request.getParameter("contact");
		int fees = Integer.parseInt(request.getParameter("fees"));
		String admission_date = request.getParameter("admission_date");
		String course = request.getParameter("course");
		Student st= new Student(name, username, password, address, contact, course, admission_date, fees);
		StudentDeclaration sd=new StudentOperations();
		int id=sd.insertStudent(st);
		if(id>0) {
			writer.println("Inserted Successfully");
		} else {
			writer.println("Insertion Failed");
		}
}
}
