package hcmute.services;

import java.util.List;

import hcmute.DAO.AnswerLessonDaoImpl;
import hcmute.entity.AnswerLesson;

public class AnswerLessonServiceImpl implements IAnswerLessonService{

	AnswerLessonDaoImpl ansDao = new AnswerLessonDaoImpl();
	@Override
	public List<AnswerLesson> findAll() {
		// TODO Auto-generated method stub
		return ansDao.findAll();
	}

	@Override
	public AnswerLesson findOneById(String id) {
		// TODO Auto-generated method stub
		return ansDao.findById(id);
	}

	@Override
	public void delete(String id) throws Exception {
		ansDao.delete(id);
	}

	@Override
	public void update(AnswerLesson ans) {
		ansDao.update(ans);
	}

	@Override
	public void insert(AnswerLesson ans) {
		ansDao.insert(ans);
	}

	@Override
	public List<AnswerLesson> findByLessonId(String lessonId) {
		return ansDao.findByLessonId(lessonId);
	}

}
