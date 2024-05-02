package hcmute.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.ANSWER_LESSON_RELATION)
public class AnswerLesson implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	private String answerId;
	
	@Column(name = "answerKey")
	private String answerKey;
	
	@Column(name = "number")
	private Integer number;
	
	@ManyToOne
	@JoinColumn(name = "lessonId")
	private Lesson lessons;

	@OneToMany(mappedBy = "answerLesson", fetch = FetchType.LAZY)
	private List<AnswerLessonUser> answerLessonUser;
	
	public AnswerLesson() {
		super();
	}

	public String getAnswerId() {
		return answerId;
	}

	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}

	public String getAnswerKey() {
		return answerKey;
	}

	public void setAnswerKey(String answerKey) {
		this.answerKey = answerKey;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Lesson getLessons() {
		return lessons;
	}

	public void setLessons(Lesson lessons) {
		this.lessons = lessons;
	}

	public List<AnswerLessonUser> getAnswerLessonUser() {
		return answerLessonUser;
	}

	public void setAnswerLessonUser(List<AnswerLessonUser> answerLessonUser) {
		this.answerLessonUser = answerLessonUser;
	}

	public AnswerLesson(String answerId, String answerKey, Integer number, Lesson lessons,
			List<AnswerLessonUser> answerLessonUser) {
		this.answerId = answerId;
		this.answerKey = answerKey;
		this.number = number;
		this.lessons = lessons;
		this.answerLessonUser = answerLessonUser;
	}
	
	
	
}
