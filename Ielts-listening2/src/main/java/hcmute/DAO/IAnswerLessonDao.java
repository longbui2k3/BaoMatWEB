package hcmute.DAO;

import java.util.List;

import hcmute.entity.AnswerLesson;

public interface IAnswerLessonDao {
	List<AnswerLesson> findByLessonId(String lessonId);
}
