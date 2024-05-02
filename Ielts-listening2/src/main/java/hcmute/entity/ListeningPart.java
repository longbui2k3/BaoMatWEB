package hcmute.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

import hcmute.utils.Constants;

@Entity
@Table(name = Constants.LISTENING_PART_RELATION)
public class ListeningPart implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String partId;

	@Column(columnDefinition = "varchar(255)")
	private String image;

	@Column(columnDefinition = "int")
	private Integer number;

	@Column(columnDefinition = "varchar(255)")
	private String audio;

	@Column(columnDefinition = "varchar(10000)")
	private String answerSheet;

	@OneToMany(mappedBy = "listeningParts", fetch = FetchType.EAGER)
	private List<AnswerTest> answerTests;

	@ManyToOne
	@JoinColumn(name = "testId")
	private MockTest mockTests;

	public ListeningPart(String partId, String image, Integer number, String audio, String answerSheet,
			List<AnswerTest> answerTests, MockTest mockTests) {
		super();
		this.partId = partId;
		this.image = image;
		this.number = number;
		this.audio = audio;
		this.answerSheet = answerSheet;
		this.answerTests = answerTests;
		this.mockTests = mockTests;
	}

	public String getPartId() {
		return partId;
	}

	public void setPartId(String partId) {
		this.partId = partId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public String getAnswerSheet() {
		return answerSheet;
	}

	public void setAnswerSheet(String answerSheet) {
		this.answerSheet = answerSheet;
	}

	public List<AnswerTest> getAnswerTests() {
		return answerTests;
	}

	public void setAnswerTests(List<AnswerTest> answerTests) {
		this.answerTests = answerTests;
	}

	public MockTest getMockTests() {
		return mockTests;
	}

	public void setMockTests(MockTest mockTests) {
		this.mockTests = mockTests;
	}

	public ListeningPart() {
		super();
	}

}
