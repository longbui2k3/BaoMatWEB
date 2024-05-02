package hcmute.DAO;

import java.util.List;

import hcmute.entity.Course;
import hcmute.entity.Lesson;

public interface IAdminLessonDAO {
	List<Lesson> findLessonByCourse(String courseId);
	Lesson getNewLesson();
}
