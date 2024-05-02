package hcmute.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.MOCK_TEST_RELATION)
public class MockTest implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private String testId;
	
	@Column(name =  "testName")
	private String testName;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "cost")
	private int cost;
	
	@ManyToOne
	@JoinColumn(name = "topicId")
	private TopicTest topicTests;
	
	@OneToMany(mappedBy = "mockTests", fetch = FetchType.LAZY)
	private List<ListeningPart> listeningParts;
	
	@OneToMany(mappedBy = "mockTests", fetch = FetchType.LAZY)
	private List<EnrrolTest> enrrolTests;

	public MockTest(String testId, String testName, String description, int cost, TopicTest topicTests,
			List<ListeningPart> listeningParts, List<EnrrolTest> enrrolTests) {
		super();
		this.testId = testId;
		this.testName = testName;
		this.description = description;
		this.cost = cost;
		this.topicTests = topicTests;
		this.listeningParts = listeningParts;
		this.enrrolTests = enrrolTests;
	}

	public MockTest() {
		super();
	}
	
	public String getTestId() {
		return testId;
	}

	public void setTestId(String testId) {
		this.testId = testId;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public TopicTest getTopicTests() {
		return topicTests;
	}

	public void setTopicTests(TopicTest topicTests) {
		this.topicTests = topicTests;
	}

	public List<ListeningPart> getListeningParts() {
		return listeningParts;
	}

	public void setListeningParts(List<ListeningPart> listeningParts) {
		this.listeningParts = listeningParts;
	}

	public List<EnrrolTest> getEnrrolTests() {
		return enrrolTests;
	}

	public void setEnrrolTests(List<EnrrolTest> enrrolTests) {
		this.enrrolTests = enrrolTests;
	}
	
}
