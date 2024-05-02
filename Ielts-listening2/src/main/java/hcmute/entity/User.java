package hcmute.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import hcmute.utils.Constants;

@Entity
@Table(name = Constants.USER_RELATION)
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String userId;

	@Column(name = "name")
	private String name;

	@Column(name = "sex")
	private String sex;

	@Column(columnDefinition = "date")
	private String dateOfBirth;

	@Column(name = "email")
	private String email;

	@Column(name = "phoneNumber")
	private String phoneNumber;

	@Column(name = "address")
	private String address;

	@Column(name = "image")
	private String image;

	
	@Column(name = "networth")
	private Integer networth;
	
	
	@Column(name = "contributeScore")
	private Integer contributeScore;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<EnrrolLesson> enrrolLesson;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<UserCourse> userCourse;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<EnrrolTest> enrrolTests;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<Blog> blogs;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<Cart> cart;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<RepComment> repComment;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<CommentLesson> commentLesson;

	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<ReadNotify> readNotifys;

	@OneToOne
	@JoinColumn(name = "userName")
	private Account account;
	
	@OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<Payment> payment;

	public User() {
		super();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getNetworth() {
		return networth;
	}

	public void setNetworth(Integer networth) {
		this.networth = networth;
	}

	public Integer getContributeScore() {
		return contributeScore;
	}

	public void setContributeScore(Integer contributeScore) {
		this.contributeScore = contributeScore;
	}

	public List<EnrrolLesson> getEnrrolLesson() {
		return enrrolLesson;
	}

	public void setEnrrolLesson(List<EnrrolLesson> enrrolLesson) {
		this.enrrolLesson = enrrolLesson;
	}

	public List<UserCourse> getUserCourse() {
		return userCourse;
	}

	public void setUserCourse(List<UserCourse> userCourse) {
		this.userCourse = userCourse;
	}

	public List<EnrrolTest> getEnrrolTests() {
		return enrrolTests;
	}

	public void setEnrrolTests(List<EnrrolTest> enrrolTests) {
		this.enrrolTests = enrrolTests;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public List<RepComment> getRepComment() {
		return repComment;
	}

	public void setRepComment(List<RepComment> repComment) {
		this.repComment = repComment;
	}

	public List<CommentLesson> getCommentLesson() {
		return commentLesson;
	}

	public void setCommentLesson(List<CommentLesson> commentLesson) {
		this.commentLesson = commentLesson;
	}

	public List<ReadNotify> getReadNotifys() {
		return readNotifys;
	}

	public void setReadNotifys(List<ReadNotify> readNotifys) {
		this.readNotifys = readNotifys;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<Payment> getPayment() {
		return payment;
	}

	public void setPayment(List<Payment> payment) {
		this.payment = payment;
	}

	public User(String userId, String name, String sex, String dateOfBirth, String email, String phoneNumber,
			String address, String image, Integer networth, Integer contributeScore, List<EnrrolLesson> enrrolLesson,
			List<UserCourse> userCourse, List<EnrrolTest> enrrolTests, List<Blog> blogs, List<Cart> cart,
			List<RepComment> repComment, List<CommentLesson> commentLesson, List<ReadNotify> readNotifys,
			Account account, List<Payment> payment) {
		this.userId = userId;
		this.name = name;
		this.sex = sex;
		this.dateOfBirth = dateOfBirth;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.image = image;
		this.networth = networth;
		this.contributeScore = contributeScore;
		this.enrrolLesson = enrrolLesson;
		this.userCourse = userCourse;
		this.enrrolTests = enrrolTests;
		this.blogs = blogs;
		this.cart = cart;
		this.repComment = repComment;
		this.commentLesson = commentLesson;
		this.readNotifys = readNotifys;
		this.account = account;
		this.payment = payment;
	}

	
}
