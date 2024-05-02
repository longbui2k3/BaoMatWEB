package hcmute.utils.compositeId;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;

@Embeddable
public class AnswerUserId implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Column(name = "answerId")
	private String answerId;
	
	@Column(name = "enrrolId")
	private String enrrolId;
	
	public AnswerUserId() {
		super();
	}
	
	
	public AnswerUserId(String answerId, String enrrolId) {
		super();
		this.answerId = answerId;
		this.enrrolId = enrrolId;
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}


	public String getAnswerId() {
		return answerId;
	}


	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}


	public String getEnrrolId() {
		return enrrolId;
	}


	public void setEnrrolId(String enrrolId) {
		this.enrrolId = enrrolId;
	}
	

	@Override
	public String toString() {
		return "AnswerUserId [answerId=" + answerId + ", enrrolId=" + enrrolId + "]";
	}
}