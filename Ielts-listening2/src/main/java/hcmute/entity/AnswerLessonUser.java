package hcmute.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import hcmute.utils.compositeId.CompositeAnswerLessonUser;

@Entity
@IdClass(CompositeAnswerLessonUser.class)
@Table(name = "answer_lesson_user")
public class AnswerLessonUser implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@ManyToOne(cascade =  CascadeType.MERGE)
	@JoinColumn(name = "enrrolId")
	private EnrrolLesson enrrolLesson;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "answerId")
	private AnswerLesson answerLesson;
	
	@Column(name = "answerUser")
	private String answerUser;
	
	public AnswerLessonUser() {
		super();
	}

	public EnrrolLesson getEnrrolLesson() {
		return enrrolLesson;
	}

	public void setEnrrolLesson(EnrrolLesson enrrolLesson) {
		this.enrrolLesson = enrrolLesson;
	}

	public AnswerLesson getAnswerLesson() {
		return answerLesson;
	}

	public void setAnswerLesson(AnswerLesson answerLesson) {
		this.answerLesson = answerLesson;
	}

	public String getAnswerUser() {
		return answerUser;
	}

	public void setAnswerUser(String answerUser) {
		this.answerUser = answerUser;
	}

	public AnswerLessonUser(EnrrolLesson enrrolLesson, AnswerLesson answerLesson, String answerUser) {
		this.enrrolLesson = enrrolLesson;
		this.answerLesson = answerLesson;
		this.answerUser = answerUser;
	}
	
	

}
