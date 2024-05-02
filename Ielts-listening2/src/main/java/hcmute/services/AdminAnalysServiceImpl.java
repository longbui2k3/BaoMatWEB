package hcmute.services;

import java.util.List;

import hcmute.DAO.AdminAnalysDAOImpl;
import hcmute.DAO.IAdminAnalysDAO;
import hcmute.entity.Course;
import hcmute.entity.User;

public class AdminAnalysServiceImpl implements IAdminAnalysService{
	IAdminAnalysDAO adminAnaDAO = new AdminAnalysDAOImpl();
	@Override
	public Long countUser() {
		// TODO Auto-generated method stub
		return adminAnaDAO.countUser();
	}
	@Override
	public Long countCourse() {
		// TODO Auto-generated method stub
		return adminAnaDAO.countCourse();
	}
	@Override
	public Long sumRevenue() {
		// TODO Auto-generated method stub
		return adminAnaDAO.sumRevenue();
	}
	@Override
	public Long costWithMonth(int month) {
		// TODO Auto-generated method stub
		return adminAnaDAO.costWithMonth(month);
	}
	
	@Override
	public List<String> userIdDescreaseCost() {
		// TODO Auto-generated method stub
		return adminAnaDAO.userIdDescreaseCost();
	}
	@Override
	public List<Long> costDecrease() {
		// TODO Auto-generated method stub
		return adminAnaDAO.costDecrease();
	}
	@Override
	public Long countCourseByUserId(String userId) {
		// TODO Auto-generated method stub
		return adminAnaDAO.countCourseByUserId(userId);
	}
	@Override
	public Long countRatingByUserId(String userId) {
		// TODO Auto-generated method stub
		return adminAnaDAO.countRatingByUserId(userId);
	}
	@Override
	public User findUserByUserId(String userId) {
		// TODO Auto-generated method stub
		return adminAnaDAO.findUserByUserId(userId);
	}
	@Override
	public Long sumCostByUserId(String userId) {
		// TODO Auto-generated method stub
		return adminAnaDAO.sumCostByUserId(userId);
	}
	@Override
	public List<Course> listCourseOrderByTime() {
		// TODO Auto-generated method stub
		return adminAnaDAO.listCourseOrderByTime();
	}

}
