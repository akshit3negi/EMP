package dao;

import java.util.ArrayList;
import java.util.List;

import bean.Question;
import bean.Subject;

//register->controller->bean->
public interface QuestionDeclaration {
	int insertQuest(Question q);

	boolean update(int id, Question q);

	boolean delete(int id);

	Question selectQuestion(int id);

	ArrayList<Question> selectAllQuestion();

	List<Question> search(String username);
	
	List<Question> selectBySubject(Subject sub);

}
