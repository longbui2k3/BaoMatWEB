package hcmute.entity;

import java.io.Serializable;
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
@Table(name = "comment_lesson")
public class CommentLesson implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String commentId;
	
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "createTime")
	private Date createTime;
	
	@OneToMany(mappedBy = "commentLesson", fetch = FetchType.LAZY)
	private List<RepComment> repComment;
	
	@ManyToOne
	@JoinColumn(name = "lessonId")
	private Lesson lessons;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;
	
	public CommentLesson() {
		super();
	}

	public CommentLesson(String commentId, String comment, Date createTime, List<RepComment> repComment, Lesson lessons,
			User users) {
		this.commentId = commentId;
		this.comment = comment;
		this.createTime = createTime;
		this.repComment = repComment;
		this.lessons = lessons;
		this.users = users;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public List<RepComment> getRepComment() {
		return repComment;
	}

	public void setRepComment(List<RepComment> repComment) {
		this.repComment = repComment;
	}

	public Lesson getLessons() {
		return lessons;
	}

	public void setLessons(Lesson lessons) {
		this.lessons = lessons;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}
	
	
	
}
