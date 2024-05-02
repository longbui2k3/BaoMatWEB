package hcmute.DAO;

import java.util.List;

import hcmute.entity.UserCourse;

public interface IUserCourseDAO {
	List<UserCourse> findByUserIdAndCourseId(String userId, String courseId);

	int countUserCourse(String courseId);
}
