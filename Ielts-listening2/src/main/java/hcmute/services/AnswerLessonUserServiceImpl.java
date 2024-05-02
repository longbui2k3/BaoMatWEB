package hcmute.services;

import java.util.List;

import hcmute.DAO.AnswerLessonUserDaoImpl;
import hcmute.entity.AnswerLessonUser;
import hcmute.entity.EnrrolLesson;
import hcmute.utils.compositeId.CompositeAnswerLessonUser;

public class AnswerLessonUserServiceImpl implements IAnswerLessonUserService{

	AnswerLessonUserDaoImpl answerLessonUserDao = new AnswerLessonUserDaoImpl();
	@Override
	public void insert(AnswerLessonUser answerLessonUser) {
		answerLessonUserDao.insert(answerLessonUser);
	}

	@Override
	public void delete(CompositeAnswerLessonUser answerLessonUserId) {
		try {
			answerLessonUserDao.delete(answerLessonUserId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(AnswerLessonUser answerLessonUser) {
		answerLessonUserDao.update(answerLessonUser);
	}

	@Override
	public List<AnswerLessonUser> findAll() {
		return answerLessonUserDao.findAll();
	}

	@Override
	public AnswerLessonUser findById(CompositeAnswerLessonUser answerLessonUserId) {
		return answerLessonUserDao.findById(answerLessonUserId);
	}

	@Override
	public void saveOrUpdate(AnswerLessonUser answerLessonUser) {
		answerLessonUserDao.saveOrUpdate(answerLessonUser);
		/*
		CompositeAnswerLessonUser id = new CompositeAnswerLessonUser();
		id.setAnswerLesson(answerLessonUser.getAnswerLesson().getAnswerId());
		id.setEnrrolLesson(answerLessonUser.getEnrrolLesson().getEnrrolId());
		AnswerLessonUser newAnsUser = answerLessonUserDao.findById(id);
		/*
		if(newAnsUser != null) {
			newAnsUser.setAnswerUser(answerLessonUser.getAnswerUser());
			answerLessonUserDao.update(newAnsUser);
		} else {
			answerLessonUserDao.insert(answerLessonUser);
		}	
		*/
		
	}

}
