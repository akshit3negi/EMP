package dao;

import java.util.List;

import bean.Subject;

import bean.StuExamInfo;
import bean.Student;

public interface StuExamInfoDeclaration {

	int insert(StuExamInfo sei);
	StuExamInfo selectByStuAndLang(Student stu, Subject sub);
}
