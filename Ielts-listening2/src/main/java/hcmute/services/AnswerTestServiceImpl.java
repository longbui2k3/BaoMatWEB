package hcmute.services;

import java.util.List;

import hcmute.DAO.AnswerTestDao;
import hcmute.entity.AnswerTest;

public class AnswerTestServiceImpl implements IAnswerTestService {
	AnswerTestDao answerTestDao = new AnswerTestDao();

	public AnswerTest findById(String answerTestId) {
		return answerTestDao.findById(answerTestId);
	}

	public void insert(AnswerTest answerTest) {
		answerTestDao.insert(answerTest);
	}
	public void update(AnswerTest answerTest) {
		answerTestDao.update(answerTest);
	}
	@Override
	public List<AnswerTest> findByPartId(String partId) {
		// TODO Auto-generated method stub
		return answerTestDao.findByPartId(partId);
	}
}
