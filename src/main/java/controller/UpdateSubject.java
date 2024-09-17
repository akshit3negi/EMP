package controller;

import java.io.IOException;

import bean.Subject;
import dao.SubjectOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateSubject")
public class UpdateSubject extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String sub_name = request.getParameter("name");
			String sub_code = request.getParameter("code");
			int sub_passingMarks = Integer.parseInt(request.getParameter("passMarks"));
			int sub_maxMarks = Integer.parseInt(request.getParameter("maxMarks"));
			int sub_totalQuest = Integer.parseInt(request.getParameter("totalQuest"));
			int sub_duration = Integer.parseInt(request.getParameter("duration"));
			int sub_fees = Integer.parseInt(request.getParameter("subFees"));
			int sub_offer = Integer.parseInt(request.getParameter("offer"));

			Subject sub = new Subject(sub_name, sub_code, sub_passingMarks, sub_maxMarks, sub_totalQuest, sub_duration,
					sub_fees, sub_offer);

			SubjectOperations so = new SubjectOperations();
			boolean b = so.update(id, sub);
			if (b) {
				response.sendRedirect("AdminPanel/showAllSubject.jsp");
			} else {
				response.getWriter().println("Failed to Update!");
			}

		}
	}
}
