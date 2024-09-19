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

@WebServlet("/AddSubjectController")
public class AddSubjectController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubjectOperations subo=new SubjectOperations();
		StudentOperations stuo=new StudentOperations();
		Student stu=null;
		Subject sub=null;
		int stu_id=Integer.parseInt(request.getParameter("id"));
		if(request.getParameter("addsub")!=null) {
			Enumeration pNames = request.getParameterNames();
			List list=Collections.list(pNames);
			Set  set= new HashSet(list);
			
//			while(pNames.hasMoreElements()) {
//				String sname=pNames.nextElement().toString();
//				if(!sname.equals("addsub")) {
//					if(!sname.equals("id")){
////						response.getWriter().print(sname+":"+request.getParameter(sname)+" ");
//						int sub_id=Integer.parseInt(request.getParameter(sname));
//						stu=stuo.selectStudent(stu_id);
//						sub=subo.selectSubject(sub_id);
//						stu.getSub_list().add(sub);
			
			for(Object ob: set) {
				String sname=ob.toString();
				if(!sname.equals("addsub") && !sname.equals("id")) {
					int sub_id=Integer.parseInt(request.getParameter(sname));
					stu=stuo.selectStudent(stu_id);
					sub=subo.selectSubject(sub_id);
					stu.getSub_list().add(sub);
					}
				}
			
			boolean return_id=stuo.update(stu_id, stu);
			if(return_id) {
				response.sendRedirect("AdminPanel/StudentControl/UpdateStudent.jsp?id="+stu_id);
			}

		}
	}

}