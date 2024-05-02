package hcmute.utils.compositeId;

import java.io.Serializable;
import java.util.Objects;

public class CompositeAnswerLessonUser implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String enrrolLesson;
	private String answerLesson;
	public String getEnrrolLesson() {
		return enrrolLesson;
	}
	public void setEnrrolLesson(String enrrolLesson) {
		this.enrrolLesson = enrrolLesson;
	}
	public String getAnswerLesson() {
		return answerLesson;
	}
	public void setAnswerLesson(String answerLesson) {
		this.answerLesson = answerLesson;
	}
	@Override
	public int hashCode() {
		return Objects.hash(answerLesson, enrrolLesson);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CompositeAnswerLessonUser other = (CompositeAnswerLessonUser) obj;
		return Objects.equals(answerLesson, other.answerLesson) && Objects.equals(enrrolLesson, other.enrrolLesson);
	}
	
	
}