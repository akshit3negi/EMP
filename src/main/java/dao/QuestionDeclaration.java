package dao;

import java.util.ArrayList;
import java.util.List;

import bean.Question;

//register->controller->bean->
public interface QuestionDeclaration {
	int insertStudent(Question q);

	boolean update(int id, Question q);

	boolean delete(int id);

	Question selectQuestion(int id);

	ArrayList<Question> selectAllQuestion();

	List<Question> search(String username);

}
