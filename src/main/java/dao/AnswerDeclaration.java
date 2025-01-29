package dao;

import java.util.ArrayList;
import java.util.List;
import bean.Answer;
import bean.Question;
import bean.Student;

public interface AnswerDeclaration {
	int insert(Answer ans);

	boolean update(int id, Answer ans);

	boolean delete(int id);

	Answer selectAnswer(int id);

	ArrayList<Answer> selectAllAnswer();

	List<Answer> searchByQuestion(Question quest);

	List<Answer> searchByStudent(Student stu);
	}
