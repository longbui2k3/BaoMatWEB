package hcmute.utils.compositeId;

import java.io.Serializable;
import java.util.Objects;

public class CompositeUserCourse implements Serializable{

	private static final long serialVersionUID = 1L;
	private String users;
	
	private String courses;

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public String getCourses() {
		return courses;
	}

	public void setCourses(String courses) {
		this.courses = courses;
	}

	@Override
	public int hashCode() {
		return Objects.hash(courses, users);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CompositeUserCourse other = (CompositeUserCourse) obj;
		return Objects.equals(courses, other.courses) && Objects.equals(users, other.users);
	}
	
	
}
