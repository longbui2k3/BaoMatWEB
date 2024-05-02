package hcmute.services;

import java.util.List;

import hcmute.entity.AnswerTest;

public interface IAnswerTestService {
	AnswerTest findById(String answerTestId);

	void insert(AnswerTest answerTest);

	void update(AnswerTest answerTest);

	List<AnswerTest> findByPartId(String partId);
}
