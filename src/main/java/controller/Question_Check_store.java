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
import java.util.List;

import bean.Answer;
import bean.Question;
import bean.StuExamInfo;
import bean.Student;
import bean.Subject;
import dao.AnswerOperations;
import dao.QuestionOperations;
import dao.StuExamInfoOperation;
import dao.StudentOperations;
import dao.SubjectOperations;

@WebServlet("/Question_Check_store")
public class Question_Check_store extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		
//		// In your servlet handling the test page
//		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
//		response.setHeader("Pragma", "no-cache");
//		response.setDateHeader("Expires", 0);
//
//		

		System.out.println("Rendered to Question_Check_store.");
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("stuid"));
		int questid = Integer.parseInt(request.getParameter("qid"));
		int subid = Integer.parseInt(request.getParameter("subid"));
		boolean lastQ = Boolean.parseBoolean(request.getParameter("lastQ"));
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

		if (i == -1) {
			// If already answered, show message on JSP
			session.setAttribute("message", "The Question was already Answered!");
//	        request.getRequestDispatcher("Exam/ExamPhase2.jsp?subject="+subid+"&stuid="+id+"&submit=Check+status").forward(request, response);
			response.sendRedirect("Exam/ExamPhase2.jsp?subject=" + subid + "&stuid=" + id + "&submit=Check+status");
		} else if (i > 0) {
			response.sendRedirect("Exam/ExamPhase2.jsp?subject=" + subid + "&stuid=" + id + "&submit=Check+status");
		}

		if (lastQ) {
			List<Answer> li = ansop.selectByStuAndLang(stu, sub);
			int marksScored = 0;
			int correctQuest = 0;
			for (Answer record : li) {
				if (record.iscorrect()) {
					correctQuest++;
					marksScored += record.getQuest().getQuest_marks();
				}
			}
			List<Question> list=questop.getTotalQuest(sub);
			int TotalMarksSum=0;
			for(Question ql:list) {
				TotalMarksSum+=ql.getQuest_marks();
				}
			String status = (((marksScored * 100) / TotalMarksSum) > 30 ? "Pass" : "Fail");
			StuExamInfo sei = new StuExamInfo(stu, sub, marksScored, correctQuest, status, new Date().toString());
			StuExamInfoOperation seio = new StuExamInfoOperation();
			int sei_id = seio.insert(sei);
			if (sei_id > 0)
				System.out.println("StuExamInfo added successfully");
			else
				System.out.println("Failed to add StuExamInfo record");
		}
	}
}
