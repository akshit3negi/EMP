package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import bean.Student;
import bean.Subject;

public class StudentOperations implements StudentDeclaration {

	SessionFactory sf = null;
	Session session = null;
	Transaction trxn = null;

	public StudentOperations() {
		sf = new Configuration().addAnnotatedClass(Student.class).addAnnotatedClass(Subject.class)
				.buildSessionFactory();
		session = sf.openSession();
	}

	@Override
	public int insertStudent(Student s) {
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
		return s.getSid();
	}

	@Override
	public boolean update(int id, Student s) {
		trxn = session.beginTransaction();
		s.setSid(id);
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
		/*
		 * id is passed as argument because when passed by .jsp file it is passed as
		 * string, which is later converted to int (by using
		 * Integer.parseInt(request.getParameter("id"));), but if object is passed, it
		 * cannot be converted back from string to object.
		 */
		trxn = session.beginTransaction();
//  using HQL
//			int count=session.createMutationQuery("delete from Student where sid=:id")
//			.setParameter("id",id)
//			.executeUpdate();
//  using hibernate
		Student s = new Student();
		s.setSid(id);
		s.setUsername(""); // required as username is unique, can't be null.
		session.remove(s);
		/*
		 * no error in line 67 (primary key assigned to new object), because Hibernate
		 * doesn’t check the database for existence during object creation. Instead, it
		 * defers the actual database interaction until you perform certain operations
		 * (like saving or removing the object). When you call session.remove(entity),
		 * Hibernate identifies the entity to be removed based on its primary key (in
		 * your case, sid). If you make a new Student record with sid = 5 and username =
		 * "JohnDoe", and you create a new Student object with sid = 5 and username =
		 * "", calling session.remove(s) will delete the record with sid = 5 from the
		 * database, regardless of the username value in the new object.
		 */
		if (trxn != null) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public Student selectStudent(int id) {
		Student std = session.get(Student.class, id);
		if (std != null) {
			return std;
		} else {
			return null;
		}
	}

	@Override
	public ArrayList<Student> selectAllStudents() {
		List<Student> list = null;
		Query<Student> query = session.createQuery("From Student", Student.class); // for HQL class name and // variable
																					// name required.
		list = query.list();
//			list.forEach(x->System.out.println(x.getSid()+"		"+x.getUsername()+"		"+x.getCourse()));

		if (list.size() > 0) {
			return (ArrayList<Student>) list;
		}
		return null;
	}

	@Override
	public List<Student> searchByName(String username) {

		Query<Student> query = session.createQuery("FROM Student WHERE username LIKE :uname", Student.class);
		query.setParameter("uname", "%" + username + "%");
		List<Student> list = query.list();
		if (list != null) {
			return list;
		}
		return null;
	}

//	public static void main(String[] args) {
//		StudentOperations  s=new StudentOperations();
//		s.selectAllStudents();
//	}

}
