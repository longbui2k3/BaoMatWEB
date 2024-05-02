package hcmute.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.sym.Name;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import hcmute.utils.Constants;
import hcmute.utils.compositeId.AnswerUserId;

/**
 * Entity implementation class for Entity: AnswerUser
 *
 */
@Entity
@Table(name = Constants.ANSWER_USER_RELATION)
public class AnswerUser implements Serializable {

	
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private AnswerUserId answerUserId;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "answerId", insertable = false, updatable = false)
	private AnswerTest answerTest;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "enrrolId", insertable = false, updatable = false)
	private EnrrolTest enrollTest;
	private String answer;
	public AnswerUser() {
		super();
	}
	public AnswerUser(AnswerUserId answerUserId, AnswerTest answerTest, EnrrolTest enrollTest, String answer) {
		super();
		this.answerUserId = answerUserId;
		this.answerTest = answerTest;
		this.enrollTest = enrollTest;
		this.answer = answer;
	}
	public AnswerUserId getAnswerUserId() {
		return answerUserId;
	}
	public void setAnswerUserId(AnswerUserId answerUserId) {
		this.answerUserId = answerUserId;
	}
	public AnswerTest getAnswerTest() {
		return answerTest;
	}
	public void setAnswerTest(AnswerTest answerTest) {
		this.answerTest = answerTest;
	}
	public EnrrolTest getEnrollTest() {
		return enrollTest;
	}
	public void setEnrollTest(EnrrolTest enrollTest) {
		this.enrollTest = enrollTest;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "AnswerUser [answerUserId=" + answerUserId + ", answerTest=" + answerTest + ", enrollTest=" + enrollTest
				+ ", answer=" + answer + "]";
	}
	
}
