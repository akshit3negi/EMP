package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

@Entity
public class Student implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sid;
	private int fees;
	private String name, password, address, contact, course, admission_date;
	@Column(unique = true, nullable = false)
	private String username;
	@ManyToMany(cascade = CascadeType.ALL)
	private Set<Subject> sub_list = new HashSet<>(10);

	public Student() {
	}

	public Student(String name, String username, String password, String address, String contact, String course,
			String admission_date, int fees) {
		this.name = name;
		this.username = username;
		this.password = password;
		this.address = address;
		this.contact = contact;
		this.fees = fees;
		this.course = course;
		this.admission_date = admission_date;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getSid() {
		return sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getFees() {
		return fees;
	}

	public void setFees(int fees) {
		this.fees = fees;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getAdmission_date() {
		return admission_date;
	}

	public void setAdmission_date(String admission_date) {
		this.admission_date = admission_date;
	}

	public Set<Subject> getSub_list() {
		return sub_list;
	}

	public void setSub_list(Set<Subject> sub_list) {
		this.sub_list = sub_list;
	}

}
