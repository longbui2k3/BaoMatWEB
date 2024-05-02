package hcmute.entity;

public class EnrollLessonCombine {
	Lesson lesson;
	EnrrolLesson enrollLesson;

	public EnrrolLesson getEnrollLesson() {
		return enrollLesson;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setEnrollLesson(EnrrolLesson enrollLesson) {
		this.enrollLesson = enrollLesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public EnrollLessonCombine() {

	}
}
