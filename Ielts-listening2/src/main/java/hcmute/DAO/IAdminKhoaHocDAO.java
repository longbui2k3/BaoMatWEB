package hcmute.DAO;

import java.util.List;

import hcmute.entity.Course;
import hcmute.entity.TopicTest;

public interface IAdminKhoaHocDAO {

	List<Course> FindAllCourseIncreaseCost();

	List<Course> FindAllCourseDecreaseCost();

	List<Course> FindAllCourseIncreaseRate();

	List<Course> FindAllCourseDecreaseRate();

	void deleteCourse(String courseId) throws Exception;

	List<Course> findAll(int page, int pagesize, String searchStr, int tab);

	List<Course> findAll(String searchStr, int tab);

	List<Course> FindCourseIncreaseRate();
}
