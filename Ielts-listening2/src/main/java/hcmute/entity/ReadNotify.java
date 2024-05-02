package hcmute.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import hcmute.utils.Constants;
import hcmute.utils.compositeId.CompositeReadNotify;

@Entity
@IdClass(CompositeReadNotify.class) 
@Table(name = Constants.READ_NOTIFY_RELATION)
public class ReadNotify implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "seen")
	private boolean seen;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "notifyId")
	private Notify notify;
	
	public ReadNotify() {
		super();
	}

	public ReadNotify(boolean seen, User users, Notify notify) {
		super();
		this.seen = seen;
		this.users = users;
		this.notify = notify;
	}

	public boolean isSeen() {
		return seen;
	}

	public void setSeen(boolean seen) {
		this.seen = seen;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public Notify getNotify() {
		return notify;
	}

	public void setNotify(Notify notify) {
		this.notify = notify;
	}
	
	
}
