package hcmute.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.ENRROL_TEST_RELATION)
public class EnrrolTest implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String enrrolId;
	
	@Column(columnDefinition = "datetime")
	private LocalDateTime enrrollmentDate;
	
	@Column(columnDefinition = "int")
	private Integer timeTest;
	
	@Column(columnDefinition = "double")
	private Double score;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;
	
	@ManyToOne
	@JoinColumn(name = "testId")
	private MockTest mockTests;
	
	@OneToMany(mappedBy = "enrollTest", fetch = FetchType.LAZY)
	private List<AnswerUser> answerUsers;

	
	public EnrrolTest() {
		super();
	}


	public EnrrolTest(String enrrolId, LocalDateTime enrrollmentDate, Integer timeTest, Double score, User users,
			MockTest mockTests, List<AnswerUser> answerUsers) {
		super();
		this.enrrolId = enrrolId;
		this.enrrollmentDate = enrrollmentDate;
		this.timeTest = timeTest;
		this.score = score;
		this.users = users;
		this.mockTests = mockTests;
		this.answerUsers = answerUsers;
	}


	public String getEnrrolId() {
		return enrrolId;
	}


	public void setEnrrolId(String enrrolId) {
		this.enrrolId = enrrolId;
	}


	public  Date getEnrrollmentDate() {
		
		ZonedDateTime zonedDateTime = enrrollmentDate.atZone(ZoneId.systemDefault());       
		return Date.from(zonedDateTime.toInstant());
	}


	public void setEnrrollmentDate(LocalDateTime enrrollmentDate) {
		this.enrrollmentDate = enrrollmentDate;
	}


	public Integer getTimeTest() {
		return timeTest;
	}


	public void setTimeTest(Integer timeTest) {
		this.timeTest = timeTest;
	}


	public Double getScore() {
		return score;
	}


	public void setScore(Double score) {
		this.score = score;
	}


	public User getUsers() {
		return users;
	}


	public void setUsers(User users) {
		this.users = users;
	}


	public MockTest getMockTests() {
		return mockTests;
	}


	public void setMockTests(MockTest mockTests) {
		this.mockTests = mockTests;
	}


	public List<AnswerUser> getAnswerUsers() {
		return answerUsers;
	}


	public void setAnswerUsers(List<AnswerUser> answerUsers) {
		this.answerUsers = answerUsers;
	}

}
