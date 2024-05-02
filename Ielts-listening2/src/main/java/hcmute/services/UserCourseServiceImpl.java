package hcmute.services;

import java.util.List;

import hcmute.DAO.IUserCourseDAO;
import hcmute.DAO.UserCourseDAOImpl;
import hcmute.entity.UserCourse;

public class UserCourseServiceImpl implements IUserCourseService {
	IUserCourseDAO userCourseDAO = new UserCourseDAOImpl();
	UserCourseDAOImpl abs = new UserCourseDAOImpl();

	public List<UserCourse> findByUserIdAndCourseId(String userId, String courseId) {
		return userCourseDAO.findByUserIdAndCourseId(userId, courseId);
	}

	@Override
	public void insert(UserCourse userCourse) {
		// TODO Auto-generated method stub
		abs.insert(userCourse);
	}

	@Override
	public int countUserCourse(String courseId) {
		// TODO Auto-generated method stub
		return userCourseDAO.countUserCourse(courseId);
	}
}
