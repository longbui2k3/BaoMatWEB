package hcmute.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.BLOG_RELATION)
public class Blog implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String blogId;

	@Column(name = "createdDate")
	private Date createdDate;

	@Column(name = "content")
	private String content;

	@Column(name = "title")
	private String title;

	@Column(name = "image")
	private String image;
	
	@Column(name = "status")
	private Integer status;
	
	@ManyToOne
	@JoinColumn(name = "creatorId") 
	private User users;
	public String getBlogId() {
		return blogId;
	}
	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	public Blog(String blogId, Date createdDate, String content, String title, String image, Integer status,
			User users) {
		
		this.blogId = blogId;
		this.createdDate = createdDate;
		this.content = content;
		this.title = title;
		this.image = image;
		this.status = status;
		this.users = users;
	}
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}
}
