package hcmute.services;

import java.util.List;

import hcmute.entity.Course;

public interface ICourseService {
	void insert(Course course);

	Course findById(String courseId);
	void update(Course course);
	List<Course> findAll();
}
