package bean;
import jakarta.persistence.*;
@Entity
public class Answer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ans_id;
	@ManyToOne(cascade = CascadeType.ALL)
	private Subject sub;
	@ManyToOne(cascade = CascadeType.ALL)
	private Student stu;
	@OneToOne(cascade = CascadeType.ALL)
	private Question quest;
	private String ansdate, anstext;
	private boolean correct;
	public Answer(Subject sub, Student stu, Question quest, String anstext, boolean correct, String ansdate) {
		this.sub = sub;
		this.stu = stu;
		this.quest = quest;
		this.anstext = anstext;
		this.correct = correct;
		this.ansdate = ansdate;
	}
	public Answer() {
	}
	public Subject getSub() {
		return sub;
	}
	public void setSub(Subject sub) {
		this.sub = sub;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public Question getQuest() {
		return quest;
	}
	public void setQuest(Question quest) {
		this.quest = quest;
	}
	public boolean iscorrect() {
		return correct;
	}
	public void setcorrect(boolean correct) {
		this.correct = correct;
	}
	public String getAnsdate() {
		return ansdate;
	}
	public void setAnsdate(String ansdate) {
		this.ansdate = ansdate;
	}
	public String getAnstext() {
		return anstext;
	}
	public void setAnstext(String anstext) {
		this.anstext = anstext;
	}
	public int getAns_id() {
		return this.ans_id;
	}
	public void setAns_id(int ans_id) {
		this.ans_id = ans_id;
	}
}