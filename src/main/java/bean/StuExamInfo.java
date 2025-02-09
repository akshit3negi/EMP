package bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;

@Entity
public class StuExamInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@OneToOne
	private Student stu;
	@OneToOne
	private Subject sub;
	private int correctQuest;
	private int marks;
	private String status;
	private String date;
	
	public StuExamInfo() { }

	public StuExamInfo(Student stu, Subject sub, int marks, int correctQuest, String status, String date) {
		super();
		this.stu = stu;
		this.sub = sub;
		this.marks = marks;
		this.correctQuest=correctQuest;
		this.date = date;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Subject getSub() {
		return sub;
	}

	public void setSub(Subject sub) {
		this.sub = sub;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCorrectQuest() {
		return correctQuest;
	}

	public void setCorrectQuest(int correctQuest) {
		this.correctQuest = correctQuest;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
