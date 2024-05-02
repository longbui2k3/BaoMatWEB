package hcmute.services;

import java.util.List;

import hcmute.entity.EnrrolLesson;

public interface IEnrollLessonService {
	List<EnrrolLesson> findAll();
	EnrrolLesson findOneById(String enrLessonId);
	void update(EnrrolLesson model);
	void delete(String enLessId) throws Exception;
	void insert(EnrrolLesson model);
	EnrrolLesson findOneByUser_Lesson(String userId, String lessId);
	EnrrolLesson findByUserIdAndLessonId(String UserId, String LessonId);
	void completeTest(String enrollLessonId);
	void resetTest(String enrollLessonId);
	EnrrolLesson findOneByIdContainAnsTestAndAnsUser(String enrollLessonId);
	List<EnrrolLesson> findByLesson(String lessonId);
}

	