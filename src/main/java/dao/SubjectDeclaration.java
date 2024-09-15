package dao;

import java.util.List;

import bean.Subject;

public interface SubjectDeclaration {
	int insertSubject(Subject s);

	boolean update(int id, Subject s);

	boolean delete(int id);

	Subject selectSubject(int id);

	List<Subject> selectAllSubject();

	List<Subject> searchByName(String username);

	List<Subject> searchByCode(int id);

}
