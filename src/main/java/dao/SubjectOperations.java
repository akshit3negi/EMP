package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import bean.Subject;

public class SubjectOperations implements SubjectDeclaration {
	SessionFactory sf = null;
	Session session = null;
	Transaction trxn = null;

	public SubjectOperations() {
		sf = new Configuration().addAnnotatedClass(Subject.class).buildSessionFactory();
		session = sf.openSession();
	}

	@Override
	public int insertSubject(Subject s) {
		boolean flag = false;
		try {
			trxn = session.beginTransaction();
			session.persist(s);
			System.out.println("try executed.");
			flag = true;
		} catch (HibernateException e) {
			System.out.println(e);
		}
		if (flag) {
			trxn.commit();
		} else {
			trxn.rollback();
		}
		return s.getSub_id();
	}

	@Override
	public boolean update(int id, Subject s) {
		trxn = session.beginTransaction();
		s.setSub_id(id);
		session.merge(s);
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
//  using HQL
//	int count=session.createMutationQuery("delete from Subject where sub_id=:id").setParameter("id",id).executeUpdate();
//  using hibernate
		Subject s = new Subject();
		s.setSub_id(id);
		s.setSub_name(""); // required as username is unique, can't be null.
		s.setSub_code("");
		session.remove(s);
		if (trxn != null) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public Subject selectSubject(int id) {
		Subject sub = session.get(Subject.class, id);
		if (sub != null) {
			return sub;
		} else {
			return null;
		}
	}

	@Override
	public List<Subject> selectAllSubject() {
		List<Subject> list = null;
		Query<Subject> query = session.createQuery("From Subject", Subject.class); // for HQL- class name and variable
																					// name required.
		list = query.list();

		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	@Override
	public List<Subject> searchByName(String username) {
		Query<Subject> query = session.createQuery("FROM Subject WHERE sub_name LIKE :sub_name", Subject.class);
		query.setParameter("sub_name", "%" + username + "%");
		List<Subject> list = query.list();
		if (list != null) {
			return list;
		}
		return null;
	}

	@Override
	public List<Subject> searchByCode(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
