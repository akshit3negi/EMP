package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import bean.Student;
import bean.Subject;
import dao.StudentOperations;
import dao.SubjectOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RemoveSubjectFromStudent")
public class RemoveSubjectFromStudent extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubjectOperations subo=new SubjectOperations();
		StudentOperations stuo=new StudentOperations();
		
		int stu_id=Integer.parseInt(request.getParameter("id"));
		Student stu=stuo.selectStudent(stu_id);
		Set<Subject> sublist=stu.getSub_list();
		Subject sub=null;
		System.out.println(stu_id);
		if(request.getParameter("removesub")!=null) {
			Enumeration pNames = request.getParameterNames();
			List list=Collections.list(pNames);
			for(Object ob: list) {
				String sname=ob.toString();
				if(!sname.equals("removesub") && !sname.equals("id")) {
					int sub_id=Integer.parseInt(request.getParameter(sname));
					sub=subo.selectSubject(sub_id);
					Subject subname=null;
					for(Subject subject:sublist) {
						if(subject.getSub_id()==sub.getSub_id()) {
							subname=subject;
						}
					}
					stu.getSub_list().remove(subname);
					}
				}
			
			boolean return_id=stuo.update(stu_id, stu);
			if(return_id) {
				response.sendRedirect("AdminPanel/StudentControl/UpdateStudent.jsp?id="+stu_id);
			}

		}
	}
}
