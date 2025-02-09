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

public class QuestionOperations implements QuestionDeclaration {
	SessionFactory sf = null;
	Session session = null;
	Transaction trxn = null;

	public QuestionOperations() {
		sf = new Configuration().addAnnotatedClass(Question.class).addAnnotatedClass(Subject.class)
				.addAnnotatedClass(Options.class).addAnnotatedClass(Answer.class).addAnnotatedClass(Student.class).buildSessionFactory();
		session = sf.openSession();
	}

	@Override
	public int insertQuest(Question q) {
		boolean flag = false;
		Question quest = null;
		try {
			trxn = session.beginTransaction();
			quest = session.merge(q);
//			System.out.println("---->>>>>>Merge Done");
			flag = true;
		} catch (HibernateException e) {
			System.out.println(e);
		}
		if (flag)
			trxn.commit();
		else
			trxn.rollback();

		return quest.getQuest_id();
	}

	@Override
	public boolean update(int id, Question q) {
		trxn = session.beginTransaction();
		q.setQuest_id(id);
		session.merge(q);
		if (trxn != null) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public boolean delete(int id) {
		trxn = session.beginTransaction();
		Question q = new Question();
		q.setQuest_id(id);
//			session.delete(q);
		session.remove(q);
		if (trxn != null) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public Question selectQuestion(int id) {
		Question q = session.get(Question.class, id);
		if (q != null) {
//			System.out.println("---->>>> Select Question, return q.");
			return q;
		} else {
			return null;
		}
	}

	@Override
	public ArrayList<Question> selectAllQuestion() {
		List<Question> list = null;
		Query<Question> query = session.createQuery("From Question", Question.class);
		list = query.list();
		if (list.size() > 0) {
			return (ArrayList<Question>) list;
		}
		return null;
	}

	@Override
	public List<Question> search(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Question> selectBySubject(Subject sub) {
		Query<Question> query = session.createQuery("FROM Question q WHERE q.subject = :subject", Question.class);
		query.setParameter("subject", sub);
		return query.getResultList();
	}

	@Override
	public List<Question> selectNotIn(Subject sub, Student stu) {
//		Query<Question> query=session.createQuery("from Question where Quest_id not in(select quest.Quest_id from Answer where stu.sid="+stu.getSid()+" and sub.sub_id="+sub.getSub_id()+")", Question.class);

		Query<Question> query = session.createQuery(
			    "FROM Question WHERE subject.sub_id= :QsubId AND Quest_id NOT IN (SELECT quest.Quest_id FROM Answer WHERE stu.sid = :stuId AND sub.sub_id = :subId)", 
			    Question.class);
			query.setParameter("QsubId", sub.getSub_id());
			query.setParameter("stuId", stu.getSid());
			query.setParameter("subId", sub.getSub_id());
		return query.getResultList();
	}

	@Override
	public List<Question> getTotalQuest(Subject sub) {
		Query<Question> query=session.createQuery("from Question where subject.sub_id=:subId", Question.class);
		query.setParameter("subId",sub.getSub_id());
		return query.getResultList();
		
	}
	
	

}
