package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import bean.Answer;
import bean.StuExamInfo;
import bean.Student;
import bean.Subject;

public class StuExamInfoOperation implements StuExamInfoDeclaration{

	SessionFactory sf =null;
	Session session=null;
	Transaction trxn=null;
	
	public StuExamInfoOperation() {
		sf=new Configuration().addAnnotatedClass(StuExamInfo.class).addAnnotatedClass(Student.class).addAnnotatedClass(Subject.class).buildSessionFactory();
		session=sf.openSession();
	}
	
	
	@Override
	public int insert(StuExamInfo sei) {
		try {
			trxn=session.beginTransaction();
			sei=session.merge(sei);
			trxn.commit();
		} catch(Exception e) {
			trxn.rollback();
		}
		return sei.getId();
	}


	@Override
	public StuExamInfo selectByStuAndLang(Student stu, Subject sub) {
	Query<StuExamInfo> query = session.createQuery("FROM StuExamInfo WHERE stu = :student AND sub= :subject", StuExamInfo.class);
		query.setParameter("student", stu);
		query.setParameter("subject", sub);
		return query.uniqueResult();
	}
}

