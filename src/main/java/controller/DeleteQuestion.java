package controller;

import java.io.IOException;
import java.util.ArrayList;

import bean.Options;
import dao.OptionOperations;
import dao.QuestionOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteQuestion")
public class DeleteQuestion extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		QuestionOperations qo = new QuestionOperations();
		OptionOperations oo=new OptionOperations();
		ArrayList<Options> op=oo.selectAllOption();
		Options option=null;
		for(Options opt:op){
			if(id==opt.getQuestNum().getQuest_id())
				option=opt;
		}
		int opid=option.getOption_id();
		
		boolean o =oo.delete(opid);
		boolean q = qo.delete(id);
		
		if (o && q) {
			response.sendRedirect("AdminPanel/showAllQuestion.jsp");
		} else {
			response.getWriter().println("Failed to delete!");
		}
	}

}