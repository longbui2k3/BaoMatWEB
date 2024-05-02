package hcmute.services;

import java.util.List;

import hcmute.DAO.AdminKhoaHocDAOImpl;
import hcmute.DAO.IAdminKhoaHocDAO;
import hcmute.entity.Course;

public class AdminKhoaHocServiceImpl implements IAdminKhoaHocService {
	IAdminKhoaHocDAO khoaHocDAO = new AdminKhoaHocDAOImpl();
	AdminKhoaHocDAOImpl KhoaHocABS = new AdminKhoaHocDAOImpl();

	@Override
	public Long countKhoaHoc() {
		return KhoaHocABS.countAll();
	}

	@Override
	public List<Course> FindAllCourse() {
		return KhoaHocABS.findAll();
	}

	@Override
	public List<Course> FindAllCourseIncreaseCost() {
		return khoaHocDAO.FindAllCourseIncreaseCost();
	}

	@Override
	public List<Course> FindAllCourseDecreaseCost() {
		return khoaHocDAO.FindAllCourseDecreaseCost();
	}

	@Override
	public void deleteCourse(String course) throws Exception {
		khoaHocDAO.deleteCourse(course);
	}

	@Override
	public List<Course> FindAllCourseIncreaseRate() {
		return khoaHocDAO.FindAllCourseIncreaseRate();
	}

	@Override
	public List<Course> FindAllCourseDecreaseRate() {
		return khoaHocDAO.FindAllCourseDecreaseRate();
	}

	@Override
	public List<Course> findAll(int page, int pagesize, String searchStr, int tab) {
		// TODO Auto-generated method stub
		return khoaHocDAO.findAll(page, pagesize, searchStr, tab);
	}

	@Override
	public List<Course> findAll(String searchStr, int tab) {
		// TODO Auto-generated method stub
		return khoaHocDAO.findAll(searchStr, tab);
	}

	@Override
	public List<Course> FindCourseIncreaseRate() {
		// TODO Auto-generated method stub
		return khoaHocDAO.FindCourseIncreaseRate();
	}

}
