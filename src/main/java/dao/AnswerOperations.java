package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import bean.Answer;
import bean.Options;
import bean.Question;
import bean.Student;
import bean.Subject;

public class AnswerOperations implements AnswerDeclaration {

	SessionFactory sf = null;
	Session session = null;
	Transaction trxn = null;

	public AnswerOperations() {
		sf = new Configuration().addAnnotatedClass(Answer.class).addAnnotatedClass(Question.class)
				.addAnnotatedClass(Student.class).addAnnotatedClass(Subject.class).buildSessionFactory();
		session = sf.openSession();
	}

	@Override
	public int insert(Answer ans) {		
		Answer answ = null;
		try {
			trxn = session.beginTransaction();
			
			  Subject sub = session.get(Subject.class, ans.getSub().getSub_id() );
		        Student stu = session.get(Student.class, ans.getStu().getSid());
		        Question quest = session.get(Question.class, ans.getQuest().getQuest_id());
		      
		        Answer existingAnswer = session.createQuery(
		        	    "FROM Answer WHERE stu = :student AND quest = :question", Answer.class)
		        	    .setParameter("student", stu)
		        	    .setParameter("question", quest)
		        	    .uniqueResult();
		        
		        if (existingAnswer != null) {
		            // Prevent re-submission of answer
		        	trxn.rollback();
		        	return -1;
		        }
		        else {
		        ans.setSub(sub);
		        ans.setStu(stu);
		        ans.setQuest(quest);			
		        answ = session.merge(ans);
		        }
		        trxn.commit();
		} catch (HibernateException e) {
			trxn.rollback();
			System.out.println(e);
		}
	
		return answ.getAns_id();
	}
		

	@Override
	public boolean update(int id, Answer ans) {
		boolean f = false;
		try {
			trxn = session.beginTransaction();
			ans.setAns_id(id);
			session.merge(ans);
			f = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		if (f) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public boolean delete(int id) {
		boolean f = false;
		try {
			trxn = session.beginTransaction();
			Answer ans = new Answer();
			ans.setAns_id(id);
			session.remove(ans);
			f = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		if (f) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public Answer selectAnswer(int id) {
		Answer ans = null;
		try {
			ans = session.get(Answer.class, id);
		} catch (Exception e) {
			System.out.println(e);
		}
		if (ans != null) {
			return ans;
		} else {
			return null;
		}
	}

	@Override
	public ArrayList<Answer> selectAllAnswer() {
		List<Answer> list = null;
		Query<Answer> query = session.createQuery("From Answer", Answer.class);
		list = query.list();
		if (list.size() > 0) {
			return (ArrayList<Answer>) list;
		}
		return null;
	}

	@Override
	public List<Answer> searchByQuestion(Question quest) {
		Query<Answer> query = session.createQuery("FROM Answer ans WHERE ans.quest = :question", Answer.class);
		query.setParameter("question", quest);
		return query.getResultList();
	}

	@Override
	public List<Answer> searchByStudent(Student stu) {
		Query<Answer> query = session.createQuery("FROM Answer ans WHERE ans.stu = :student", Answer.class);
		query.setParameter("student", stu);
		return query.getResultList();
	}

	@Override
	public List<Answer> selectByStuAndLang(Student stu, Subject sub) {
		Query<Answer> query = session.createQuery("FROM Answer ans WHERE ans.stu = :student AND ans.sub= :subject", Answer.class);
		query.setParameter("student", stu);
		query.setParameter("subject", sub);
		return query.getResultList();
	}

}
