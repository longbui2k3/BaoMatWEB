package hcmute.services;

import java.util.List;

import hcmute.DAO.AccountDAOImpl;
import hcmute.DAO.IAccountDAO;
import hcmute.DAO.IUserDAO;
import hcmute.DAO.UserDAOImpl;
import hcmute.entity.Account;
import hcmute.entity.EnrrolLesson;
import hcmute.entity.User;
import hcmute.entity.UserCourse;

public class UserServiceImpl implements IUserService {
	UserDAOImpl userDAO = new UserDAOImpl();

	@Override
	public User findUserByID(String id) {
		// TODO Auto-generated method stub
		return userDAO.findById(id);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDAO.update(user);
	}

	@Override
	public boolean findDuplicateEmail(String email, String userId) {
		// TODO Auto-generated method stub
		return userDAO.findDuplicateEmail(email, userId);
	}

	@Override
	public boolean findDuplicatePhone(String phoneNum, String userId) {
		// TODO Auto-generated method stub
		return userDAO.findDuplicatePhone(phoneNum, userId);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDAO.findAll();
	}

	@Override
	public Long countCourseByUserId(String userId) {
		// TODO Auto-generated method stub
		return userDAO.countCourseByUserId(userId);
	}

	@Override
	public List<UserCourse> findAllUserCourseByUserId(String userId) {
		// TODO Auto-generated method stub
		return userDAO.findAllUserCourseByUserId(userId);
	}

	@Override
	public List<Double> findAllScoreByUserId(String userId) {
		// TODO Auto-generated method stub
		return userDAO.findAllEnrrolTestScoreByUserId(userId);
	}

	@Override
	public List<EnrrolLesson> findAllEnrrolLessonByUserId(String userId) {
		// TODO Auto-generated method stub
		return userDAO.findAllEnrrolLessonByUserId(userId);
	}

	@Override
	public List<String> findAllTestNamefromUserId(String userId) {
		// TODO Auto-generated method stub
		return userDAO.findAllTestNamefromUserId(userId);
	}

}
