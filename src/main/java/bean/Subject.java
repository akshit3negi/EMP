package bean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Subject {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sub_id;
	@Column(unique = true, nullable = false)
	private String sub_name;
	@Column(unique = true, nullable = false)
	private String sub_code;
	private int sub_passingMarks, sub_maxMarks, sub_totalQuest, sub_duration, sub_fees, sub_offer;

	public Subject() {
		super();
	}

	public Subject(String sub_name, String sub_code, int sub_passingMarks, int sub_maxMarks, int sub_totalQuest,
			int sub_duration, int sub_fees, int sub_offer) {
		this.sub_name = sub_name;
		this.sub_code = sub_code;
		this.sub_passingMarks = sub_passingMarks;
		this.sub_maxMarks = sub_maxMarks;
		this.sub_totalQuest = sub_totalQuest;
		this.sub_duration = sub_duration;
		this.sub_fees = sub_fees;
		this.sub_offer = sub_offer;
	}

	public int getSub_id() {
		return sub_id;
	}

	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public int getSub_passingMarks() {
		return sub_passingMarks;
	}

	public void setSub_passingMarks(int sub_passingMarks) {
		this.sub_passingMarks = sub_passingMarks;
	}

	public int getSub_maxMarks() {
		return sub_maxMarks;
	}

	public void setSub_maxMarks(int sub_maxMarks) {
		this.sub_maxMarks = sub_maxMarks;
	}

	public int getSub_totalQuest() {
		return sub_totalQuest;
	}

	public void setSub_totalQuest(int sub_totalQuest) {
		this.sub_totalQuest = sub_totalQuest;
	}

	public int getSub_duration() {
		return sub_duration;
	}

	public void setSub_duration(int sub_duration) {
		this.sub_duration = sub_duration;
	}

	public int getSub_fees() {
		return sub_fees;
	}

	public void setSub_fees(int sub_fees) {
		this.sub_fees = sub_fees;
	}

	public int getSub_offer() {
		return sub_offer;
	}

	public void setSub_offer(int sub_offer) {
		this.sub_offer = sub_offer;
	}

	public String getSub_code() {
		return sub_code;
	}

	public void setSub_code(String sub_code) {
		this.sub_code = sub_code;
	}
}
