package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util_class.BCrypt;

import java.io.IOException;

import dao.StudentOperations;

import bean.Student;

@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		StudentOperations so=new StudentOperations();
		Student stu=so.selectByUsername(username);
		
		if(stu!=null && BCrypt.checkpw(password, stu.getPassword())) {
			session.setAttribute("LogedIn", stu);
			session.setAttribute("stuid", stu.getSid());
			response.sendRedirect("Exam/SelectLanguage.jsp");
		} else {
			session.setAttribute("wrong", "Invalid Username or Password.");
			response.sendRedirect("UserLogin.jsp");
		}	
	}
}