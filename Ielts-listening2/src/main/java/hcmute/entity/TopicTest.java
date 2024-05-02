package hcmute.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.TOPIC_TEST_RELATION)
public class TopicTest implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String topicId;
	
	@Column(columnDefinition = "varchar(255)")
	private String topicName;
	
	@Column(columnDefinition = "varchar(10000)")
	private String description;
	
	@Column(columnDefinition = "datetime")
	private Date createTime;

	
	@Column(columnDefinition = "varchar(255)")
	private String image;
	
	@OneToMany(mappedBy = "topicTests", fetch = FetchType.EAGER)
	private List<MockTest> mockTests;

	@Override
	public String toString() {
		return "TopicTest [topicId=" + topicId + ", topicName=" + topicName + ", description=" + description
				+ ", createTime=" + createTime + ", image=" + image + ", mockTests=" + mockTests.toString() + "]";
	}
	public TopicTest(String topicId, String topicName, String description, Date createTime, String image,
			List<MockTest> mockTests) {
		super();
		this.topicId = topicId;
		this.topicName = topicName;
		this.description = description;
		this.createTime = createTime;
		this.image = image;
		this.mockTests = mockTests;
	}
	public TopicTest() {	
		super();
	}
	

	public String getTopicId() {
		return topicId;
	}



	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Date getCreateTime() {
		return createTime;
	}



	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public List<MockTest> getMockTests() {
		return mockTests;
	}



	public void setMockTests(List<MockTest> mockTests) {
		this.mockTests = mockTests;
	}
	
}
