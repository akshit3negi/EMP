package bean;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Quest_id;
	private byte Quest_marks;
	private String Quest_text, Ans_text;
	@ManyToOne(cascade = CascadeType.ALL)
	private Subject subject;
	
	public Question() {}
	public Question(byte quest_marks, String quest_text, String ans_text) {
		Quest_marks = quest_marks;
		Quest_text = quest_text;
		Ans_text = ans_text;
	}

	public byte getQuest_marks() {
		return Quest_marks;
	}

	public void setQuest_marks(byte quest_marks) {
		Quest_marks = quest_marks;
	}

	public String getQuest_text() {
		return Quest_text;
	}

	public void setQuest_text(String quest_text) {
		Quest_text = quest_text;
	}

	public String getAns_text() {
		return Ans_text;
	}

	public void setAns_text(String ans_text) {
		Ans_text = ans_text;
	}

	public int getQuest_id() {
		return Quest_id;
	}

	public void setQuest_id(int quest_id) {
		Quest_id = quest_id;
	}
	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	
	
}
