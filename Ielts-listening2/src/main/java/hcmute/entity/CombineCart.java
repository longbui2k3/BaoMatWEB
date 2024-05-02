package hcmute.entity;

public class CombineCart {
	Course course;
	String cartId;
	Boolean isBuy;

	public CombineCart() {
		this.isBuy = false;
	}

	public Boolean getIsBuy() {
		return isBuy;
	}

	public void setIsBuy(Boolean isBuy) {
		this.isBuy = isBuy;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	};

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getCartId() {
		return cartId;
	}

	public Course getCourse() {
		return course;
	}
}
