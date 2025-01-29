package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import bean.Options;
import bean.Question;
import dao.OptionOperations;
import dao.QuestionOperations;
import dao.SubjectOperations;


@WebServlet("/AddQuestionController")
public class AddQuestionController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int subject_id=Integer.parseInt(request.getParameter("subId"));			//TBC
		byte marks=Byte.parseByte(request.getParameter("question_marks"));
		String quest_text=request.getParameter("quest_text");
		String ans_text=request.getParameter("ans_text");
		
		Question quest=new Question(marks, quest_text, ans_text);
		
		SubjectOperations so=new SubjectOperations();
		QuestionOperations qo=new QuestionOperations();
		quest.setSubject(so.selectSubject(subject_id));
		int Qid=qo.insertQuest(quest);
//		System.out.println("---->>>> Qid returned: "+Qid);
		if(Qid>0) {
			String option1=request.getParameter("ans_option1");
			String option2=request.getParameter("ans_option2");
			String option3=request.getParameter("ans_option3");
			String option4=request.getParameter("ans_option4");
			
			Options op=new Options(option1, option2, option3, option4);
			op.setQuestNum(qo.selectQuestion(Qid));
			OptionOperations oo=new OptionOperations();
			int Opid=oo.insertOption(op);
			response.sendRedirect("AdminPanel/AddQuestion.jsp?questAddSuccess=Question added successfully");
		}
		else
			response.sendRedirect("AdminPanel/AddQuestion.jsp?questAddSuccess=Failed to add question");
	}

}
