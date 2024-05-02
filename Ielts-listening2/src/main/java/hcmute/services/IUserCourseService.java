package hcmute.services;

import java.util.List;

import hcmute.entity.UserCourse;

public interface IUserCourseService {
	void insert(UserCourse userCourse);

	List<UserCourse> findByUserIdAndCourseId(String userId, String courseId);

	int countUserCourse(String courseId);
}
