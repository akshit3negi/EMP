package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import bean.Options;
import bean.Question;
import bean.Subject;

public class OptionOperations implements OptionDeclaration {

	SessionFactory sf = null;
	Session session = null;
	Transaction trxn = null;

	public OptionOperations() {
		sf = new Configuration().addAnnotatedClass(Options.class).addAnnotatedClass(Question.class)
				.addAnnotatedClass(Subject.class).buildSessionFactory();
		session = sf.openSession();
	}

	@Override
	public int insertOption(Options o) {
//		System.out.println("------->>>>>> insertOption() called.");
		boolean flag = false;
		try {
			trxn = session.beginTransaction();
//		System.out.println("--->>> Before OptionOperation Merge");
			session.merge(o);
//		System.out.println("----->>>>> OptionOperation Merger");
			flag = true;
		} catch (HibernateException e) {
			System.out.println(e);
		}
		if (flag)
			trxn.commit();
		else
			trxn.rollback();

		return o.getOption_id();
	}

	@Override
	public boolean update(int id, Options o) {
		trxn = session.beginTransaction();
		o.setOption_id(id);
		session.merge(o);
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
		session.clear();
		trxn = session.beginTransaction();
		Options o = new Options();
		o.setOption_id(id);
//		session.delete(o);
		session.remove(o);
		if (trxn != null) {
			trxn.commit();
			return true;
		} else {
			trxn.rollback();
			return false;
		}
	}

	@Override
	public Options selectOption(int id) {
		Options o=null;
		try{
			o = session.get(Options.class, id);
		}catch(Exception e) {
			System.out.println(e);
		}
		if (o != null) {
			return o;
		} else {
			return null;
		}
	}

	@Override
	public ArrayList<Options> selectAllOption() {
		List<Options> list = null;
		Query<Options> query = session.createQuery("From Options", Options.class);
		list = query.list();
		if (list.size() > 0) {
			return (ArrayList<Options>) list;
		}
		return null;
	}

	@Override
	public List<Options> search(String username) {
		// TODO Auto-generated method stub
		return null;
	}


}
