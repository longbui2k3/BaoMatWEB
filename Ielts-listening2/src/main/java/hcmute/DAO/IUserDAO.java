package hcmute.DAO;

import java.util.List;

import hcmute.entity.EnrrolLesson;
import hcmute.entity.User;
import hcmute.entity.UserCourse;

public interface IUserDAO {
	boolean findDuplicateEmail(String email, String userId);

	boolean findDuplicatePhone(String phoneNum, String userId);

	Long countCourseByUserId(String userId);

	List<UserCourse> findAllUserCourseByUserId(String userId);
	List<Double> findAllEnrrolTestScoreByUserId(String userId);
	List<EnrrolLesson> findAllEnrrolLessonByUserId(String userId);
	List<String> findAllTestNamefromUserId(String userId); 
}
