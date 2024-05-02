package hcmute.services;

import java.util.List;

import hcmute.entity.Course;
import hcmute.entity.Lesson;

public interface ILessonService {
	List<Lesson> findLessonByCourse(String courseId);
	Lesson findOneById (String lessonId);
	void delete(String lessonID);
	void insert(Lesson lesson);
	void update(Lesson lesson);
	
	Lesson getNewLesson();
	
}
