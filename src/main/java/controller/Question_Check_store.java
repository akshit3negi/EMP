package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.Socket;
import java.util.Date;

import bean.Answer;
import bean.Question;
import bean.Student;
import bean.Subject;
import dao.AnswerOperations;
import dao.QuestionOperations;
import dao.StudentOperations;
import dao.SubjectOperations;

@WebServlet("/Question_Check_store")
public class Question_Check_store extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Rendered to Question_Check_store.");
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("stuid"));
		int questid = Integer.parseInt(request.getParameter("qid"));
		int subid = Integer.parseInt(request.getParameter("subid"));
		String anstext = request.getParameter("answer");

		StudentOperations stuop = new StudentOperations();
		QuestionOperations questop = new QuestionOperations();
		SubjectOperations subop = new SubjectOperations();
		AnswerOperations ansop = new AnswerOperations();

		Question quest;
		Answer ans;
		Student stu;
		Subject sub;
		boolean correct = false;

		String date = new Date().toString();

		stu = stuop.selectStudent(id);
		quest = questop.selectQuestion(questid);
		sub = subop.selectSubject(subid);
		if (anstext.equals(quest.getAns_text()))
			correct = true;

		ans = new Answer(sub, stu, quest, anstext, correct, date);

		int i = ansop.insert(ans);

		if (i > 0) {
			response.getWriter().println("Inserted");
		}
	}

}
