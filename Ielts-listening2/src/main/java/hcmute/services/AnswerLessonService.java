package hcmute.services;

import java.util.List;

import hcmute.DAO.AnswerLessonDAO;
import hcmute.entity.AnswerLesson;

public class AnswerLessonService {
	AnswerLessonDAO ansLessonDao = new AnswerLessonDAO();

	public void insert(AnswerLesson entity) {
		ansLessonDao.insert(entity);
	}

	public void update(AnswerLesson entity) {
		ansLessonDao.update(entity);
	}

	public void delete(Object id) throws Exception {
		ansLessonDao.delete(id);
	}

	public AnswerLesson findById(Object id) {
		return ansLessonDao.findById(id);
	}

	public Long countAll() {
		return ansLessonDao.countAll();
	}

	public List<AnswerLesson> findAll() {
		return ansLessonDao.findAll();
	}

	public List<AnswerLesson> findAll(boolean all, int firstResult, int maxResult) {
		return ansLessonDao.findAll(all, firstResult, maxResult);
	}
	
	public List<AnswerLesson> findAnswerByLesson(String lessonId) {
		return ansLessonDao.findAnswerByLesson(lessonId);
	}
}
