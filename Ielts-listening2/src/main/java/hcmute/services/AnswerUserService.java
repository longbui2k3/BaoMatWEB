package hcmute.services;

import java.util.List;

import hcmute.DAO.AnswerUserDao;
import hcmute.entity.AnswerUser;
import hcmute.utils.compositeId.AnswerUserId;

public class AnswerUserService {
	private AnswerUserDao answerUserDao = new AnswerUserDao();
	public void insert(AnswerUser answerUser) {
		answerUserDao.insert(answerUser);
	}
	public void update(AnswerUser answerUser) {
		answerUserDao.update(answerUser);
	}
	public void delete(AnswerUser answerUser) throws Exception {
		answerUserDao.delete(answerUser);
	}
	public Long countAll() {
		return answerUserDao.countAll();
	}
	public List<AnswerUser> findAll() {
		return answerUserDao.findAll();
	}
	public void SaveOrUpdate(AnswerUser answerUser)
	{
		answerUser.setAnswer(answerUser.getAnswer().replaceAll("\\s\\s+", " ").trim());
		AnswerUser newAnswerUser = answerUserDao.findById(answerUser.getAnswerUserId());
		if (newAnswerUser == null) {
			answerUserDao.insert(answerUser);
		} else {
			newAnswerUser.setAnswer(answerUser.getAnswer());
			answerUserDao.update(newAnswerUser);
		}
	}
}
