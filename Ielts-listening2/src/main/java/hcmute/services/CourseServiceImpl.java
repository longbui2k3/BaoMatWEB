package hcmute.services;

import java.util.List;

import hcmute.DAO.CourseDAOImpl;
import hcmute.DAO.ICourseDAO;
import hcmute.entity.Course;

public class CourseServiceImpl implements ICourseService {
	CourseDAOImpl courseAbs = new CourseDAOImpl();

	@Override
	public void insert(Course course) {
		courseAbs.insert(course);
		// TODO Auto-generated method stub

	}

	@Override
	public Course findById(String courseId) {
		// TODO Auto-generated method stub
		return courseAbs.findById(courseId);
	}

	@Override
	public void update(Course course) {
		courseAbs.update(course);
		
	}

	@Override
	public List<Course> findAll() {
		// TODO Auto-generated method stub
		return courseAbs.findAll();
	}


}
