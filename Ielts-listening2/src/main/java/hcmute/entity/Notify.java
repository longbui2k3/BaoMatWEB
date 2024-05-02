package hcmute.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.NOTIFY_RELATION)
public class Notify implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String notifyId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "image")
	private String image;

	public Notify(String notifyId, String title, String description, String image) {
		this.notifyId = notifyId;
		this.title = title;
		this.description = description;
		this.image = image;
	}

	public Notify() {
		super();
	}
	
	public String getNotifyId() {
		return notifyId;
	}

	public void setNotifyId(String notifyId) {
		this.notifyId = notifyId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
