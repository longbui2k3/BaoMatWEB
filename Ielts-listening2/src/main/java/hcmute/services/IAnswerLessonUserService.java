package hcmute.services;

import java.util.List;

import hcmute.entity.AnswerLessonUser;
import hcmute.utils.compositeId.CompositeAnswerLessonUser;

public interface IAnswerLessonUserService {
	void insert(AnswerLessonUser answerLessonUser);
	void delete(CompositeAnswerLessonUser answerLessonUserId);
	void update(AnswerLessonUser answerLessonUser);
	List<AnswerLessonUser> findAll();
	AnswerLessonUser findById(CompositeAnswerLessonUser answerLessonUserId);
	void saveOrUpdate(AnswerLessonUser answerLessonUser);
}
