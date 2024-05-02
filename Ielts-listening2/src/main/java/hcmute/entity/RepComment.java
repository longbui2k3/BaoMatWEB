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
@Table(name = "rep_comment")
public class RepComment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String repCommentId;
	
	@Column(name = "replyComment")
	private String replyComment;
	
	@Column(name = "createTime")
	private Date createTime;
	
	@ManyToOne
	@JoinColumn(name = "commentId")
	private CommentLesson commentLesson;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User users;
	
	public RepComment() {
		super();
	}

	public RepComment(String repCommentId, String replyComment, Date createTime, CommentLesson commentLesson,
			User users) {
		this.repCommentId = repCommentId;
		this.replyComment = replyComment;
		this.createTime = createTime;
		this.commentLesson = commentLesson;
		this.users = users;
	}

	public String getRepCommentId() {
		return repCommentId;
	}

	public void setRepCommentId(String repCommentId) {
		this.repCommentId = repCommentId;
	}

	public String getReplyComment() {
		return replyComment;
	}

	public void setReplyComment(String replyComment) {
		this.replyComment = replyComment;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public CommentLesson getCommentLesson() {
		return commentLesson;
	}

	public void setCommentLesson(CommentLesson commentLesson) {
		this.commentLesson = commentLesson;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}
	
}

