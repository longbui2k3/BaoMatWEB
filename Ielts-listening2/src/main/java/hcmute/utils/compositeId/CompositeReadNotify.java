package hcmute.utils.compositeId;

import java.io.Serializable;
import java.util.Objects;

public class CompositeReadNotify implements Serializable{

	private static final long serialVersionUID = 1L;
	private String users;
	private String notify;
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public String getNotify() {
		return notify;
	}
	public void setNotify(String notify) {
		this.notify = notify;
	}
	@Override
	public int hashCode() {
		return Objects.hash(notify, users);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CompositeReadNotify other = (CompositeReadNotify) obj;
		return Objects.equals(notify, other.notify) && Objects.equals(users, other.users);
	}
	
	

}
