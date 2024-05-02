package hcmute.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
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

@Entity
@Table(name = "payment")
public class Payment implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String paymentId;

	@Column(name = "dateBuy")
	private String dateBuy;

	@Column(name = "cost")
	private Integer cost;

	@OneToMany(mappedBy = "payment", fetch = FetchType.EAGER)
	private List<PayDetail> payDetail;

	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getDateBuy() {
		return dateBuy;
	}

	public void setDateBuy(String dateBuy) {
		this.dateBuy = dateBuy;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public List<PayDetail> getPayDetail() {
		return payDetail;
	}

	public void setPayDetail(List<PayDetail> payDetail) {
		this.payDetail = payDetail;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", dateBuy=" + dateBuy + ", cost=" + cost + ", payDetail="
				+ payDetail + ", users=" + users + "]";
	}

	public Payment(String paymentId, String dateBuy, Integer cost, List<PayDetail> payDetail, User users) {

		this.paymentId = paymentId;
		this.dateBuy = dateBuy;
		this.cost = cost;
		this.payDetail = payDetail;
		this.users = users;
	}

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}

}