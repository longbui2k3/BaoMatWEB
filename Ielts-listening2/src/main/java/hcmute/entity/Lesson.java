package hcmute.entity;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = Constants.LESSON_RELATION)
public class Lesson implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String lessonId;

	@Column(name = "lessonName")
	private String lessonName;

	@Column(name = "description")
	private String description;

	@Column(name = "video")
	private String video;

	@Column(name = "image")
	private String image;

	@Column(name = "audio")
	private String audio;

	@Column(name = "createdDate")
	private Date createdDate;

	@Column(name = "answerSheet")
	private String answerSheet;

	@OneToMany(mappedBy = "lessons", fetch = FetchType.LAZY)
	private List<CommentLesson> commentLesson;

	@OneToMany(mappedBy = "lessons", fetch = FetchType.LAZY)
	private List<AnswerLesson> answerLesson;

	@OneToMany(mappedBy = "lessons", fetch = FetchType.EAGER)
	private List<EnrrolLesson> enrrolLesson;

	@ManyToOne
	@JoinColumn(name = "courseId")
	private Course courses;

	public Lesson() {
		super();
	}

	public String getLessonId() {
		return lessonId;
	}

	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}

	public String getLessonName() {
		return lessonName;
	}

	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getAnswerSheet() {
		return answerSheet;
	}

	public void setAnswerSheet(String answerSheet) {
		this.answerSheet = answerSheet;
	}

	public List<CommentLesson> getCommentLesson() {
		return commentLesson;
	}

	public void setCommentLesson(List<CommentLesson> commentLesson) {
		this.commentLesson = commentLesson;
	}

	public List<AnswerLesson> getAnswerLesson() {
		return answerLesson;
	}

	public void setAnswerLesson(List<AnswerLesson> answerLesson) {
		this.answerLesson = answerLesson;
	}

	public List<EnrrolLesson> getEnrrolLesson() {
		return enrrolLesson;
	}

	public void setEnrrolLesson(List<EnrrolLesson> enrrolLesson) {
		this.enrrolLesson = enrrolLesson;
	}

	public Course getCourses() {
		return courses;
	}

	public void setCourses(Course courses) {
		this.courses = courses;
	}

	public Lesson(String lessonId, String lessonName, String description, String video, String image, String audio,
			Date createdDate, String answerSheet, List<CommentLesson> commentLesson, List<AnswerLesson> answerLesson,
			List<EnrrolLesson> enrrolLesson, Course courses) {
		this.lessonId = lessonId;
		this.lessonName = lessonName;
		this.description = description;
		this.video = video;
		this.image = image;
		this.audio = audio;
		this.createdDate = createdDate;
		this.answerSheet = answerSheet;
		this.commentLesson = commentLesson;
		this.answerLesson = answerLesson;
		this.enrrolLesson = enrrolLesson;
		this.courses = courses;
	}
}
