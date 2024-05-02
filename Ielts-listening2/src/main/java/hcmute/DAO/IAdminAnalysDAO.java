package hcmute.DAO;

import java.util.List;

import hcmute.entity.Course;
import hcmute.entity.User;

public interface IAdminAnalysDAO {
	Long countUser();
	Long countCourse();
	Long sumRevenue();
	Long costWithMonth(int month);

	List<String> userIdDescreaseCost();
	List<Long> costDecrease();
	Long countCourseByUserId(String userId);
	Long countRatingByUserId(String userId);
	User findUserByUserId(String userId);
	Long sumCostByUserId(String userId);
	List<Course> listCourseOrderByTime();
}
