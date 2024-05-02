package hcmute.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String cartId;

	@Column(name = "isBuy")
	private boolean isBuy;

	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;

	@ManyToOne
	@JoinColumn(name = "courseId")
	private Course course;

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Cart() {
		super();
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public boolean isBuy() {
		return isBuy;
	}

	public void setBuy(boolean isBuy) {
		this.isBuy = isBuy;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public Cart(String cartId, boolean isBuy, User users) {
		this.cartId = cartId;
		this.isBuy = isBuy;
		this.users = users;
	}
}
