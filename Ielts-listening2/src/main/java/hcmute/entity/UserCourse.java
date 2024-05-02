package hcmute.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import hcmute.utils.compositeId.CompositeUserCourse;

@Entity
@Table(name = "user_course")
public class UserCourse implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String user_courseId;

	public String getUser_courseId() {
		return user_courseId;
	}

	public void setUser_courseId(String user_courseId) {
		this.user_courseId = user_courseId;
	}

	@OneToMany(mappedBy = "userCourse", fetch = FetchType.LAZY)
	private List<PayDetail> payDetail;

	@ManyToOne
	@JoinColumn(name = "courseId")
	private Course courses;

	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;

	@Column(name = "acceptDay")
	private Date acceptDay;

	public List<PayDetail> getPayDetail() {
		return payDetail;
	}

	public void setPayDetail(List<PayDetail> payDetail) {
		this.payDetail = payDetail;
	}

	public Course getCourses() {
		return courses;
	}

	public void setCourses(Course courses) {
		this.courses = courses;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public Date getAcceptDay() {
		return acceptDay;
	}

	public void setAcceptDay(Date acceptDay) {
		this.acceptDay = acceptDay;
	}

	public UserCourse(String user_courseId, List<PayDetail> payDetail, Course courses, User users, Date acceptDay) {
		super();
		this.user_courseId = user_courseId;
		this.payDetail = payDetail;
		this.courses = courses;
		this.users = users;
		this.acceptDay = acceptDay;
	}

	@Override
	public String toString() {
		return "UserCourse [user_courseId=" + user_courseId + ", payDetail=" + payDetail + ", courses=" + courses
				+ ", users=" + users + ", acceptDay=" + acceptDay + "]";
	}

	public UserCourse() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	

}