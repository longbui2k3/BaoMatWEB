package hcmute.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.COURSE_RELATION)
public class Course implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String courseId;

	@Column(name = "courseName")
	private String courseName;

	@Column(name = "description")
	private String description;

	@Column(name = "image")
	private String image;

	@Column(name = "cost")
	private Integer cost;

	@Column(name = "enrrollmentDate")
	private Date enrrolmentDate;

	@Column(name = "trailer")
	private String trailer;

	public String getTrailer() {
		return trailer;
	}

	public Course(String courseId, String courseName, String description, String image, Integer cost,
			Date enrrolmentDate, String trailer, List<UserCourse> userCourse, List<Lesson> lessons) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.description = description;
		this.image = image;
		this.cost = cost;
		this.enrrolmentDate = enrrolmentDate;
		this.trailer = trailer;
		this.userCourse = userCourse;
		this.lessons = lessons;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	@OneToMany(mappedBy = "courses", fetch = FetchType.LAZY)
	private List<UserCourse> userCourse;

	@OneToMany(mappedBy = "courses", fetch = FetchType.EAGER)
	private List<Lesson> lessons;

	public Course() {
		super();
	}

	public Course(String courseName, String description, String image, Integer cost, Date enrrolmentDate,
			List<UserCourse> userCourse, List<Lesson> lessons) {
		this.courseName = courseName;
		this.description = description;
		this.image = image;
		this.cost = cost;
		this.enrrolmentDate = enrrolmentDate;
		this.userCourse = userCourse;
		this.lessons = lessons;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public Date getEnrrolmentDate() {
		return enrrolmentDate;
	}

	public void setEnrrolmentDate(Date enrrolmentDate) {
		this.enrrolmentDate = enrrolmentDate;
	}

	public List<UserCourse> getUserCourse() {
		return userCourse;
	}

	public void setUserCourse(List<UserCourse> userCourse) {
		this.userCourse = userCourse;
	}

	public List<Lesson> getLessons() {
		return lessons;
	}

	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}

}
