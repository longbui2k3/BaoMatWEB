package hcmute.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Pay_Detail")
public class PayDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "Pay_DetailId")
	private String payDetailId;

	@ManyToOne
	@JoinColumn(name = "paymentId")
	private Payment payment;

	@ManyToOne
	@JoinColumn(name = "user_courseId")
	private UserCourse userCourse;
	// Constructors, getters, setters, and other annotations

	public String getPayDetailId() {
		return payDetailId;
	}

	public void setPayDetailId(String payDetailId) {
		this.payDetailId = payDetailId;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public UserCourse getUserCourse() {
		return userCourse;
	}

	public void setUserCourse(UserCourse userCourse) {
		this.userCourse = userCourse;
	}

	public PayDetail(String payDetailId, Payment payment, UserCourse userCourse) {
		super();
		this.payDetailId = payDetailId;
		this.payment = payment;
		this.userCourse = userCourse;
	}

	public PayDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

}