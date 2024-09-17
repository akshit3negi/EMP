package dao;

import java.util.ArrayList;
import java.util.List;

import bean.Option;

//register->controller->bean->
public interface OptionDeclaration {
	int insertStudent(Option o);

	boolean update(int id, Option o);

	boolean delete(int id);

	Option selectQuestion(int id);

	ArrayList<Option> selectAllOption();

	List<Option> search(String username);

}
