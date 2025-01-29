package dao;

import java.util.ArrayList;
import java.util.List;

import bean.Options;
import bean.Question;
import bean.Subject;

//register->controller->bean->
public interface OptionDeclaration {
	int insertOption(Options o);

	boolean update(int id, Options o);

	boolean delete(int id);

	Options selectOption(int id);

	ArrayList<Options> selectAllOption();

	List<Options> search(String username);

//	Options selectByQuestion(Question quest);
}
