package dao;

import java.util.ArrayList;
import java.util.List;

import bean.Student;

//register->controller->bean->
public interface StudentDeclaration {
	int insertStudent(Student s);
	boolean update(int id, Student s);
	boolean delete(int id);
	Student selectStudent(int id);
	ArrayList<Student> selectAllStudents();
	List<Student> searchByName(String username);

}
