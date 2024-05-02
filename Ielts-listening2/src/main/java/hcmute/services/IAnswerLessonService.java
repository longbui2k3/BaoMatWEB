package hcmute.services;

import java.util.List;

import hcmute.entity.AnswerLesson;

public interface IAnswerLessonService {
	List<AnswerLesson> findAll();
	AnswerLesson findOneById(String id);
	void delete(String id) throws Exception;
	void update(AnswerLesson ans);
	void insert(AnswerLesson ans);
	List<AnswerLesson> findByLessonId(String lessonId);
}
