package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.UserCourse;

public class UserCourseDAOImpl extends AbstractDao<UserCourse> implements IUserCourseDAO {

	public UserCourseDAOImpl() {
		super(UserCourse.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<UserCourse> findByUserIdAndCourseId(String userId, String courseId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT uc FROM UserCourse uc WHERE uc.users.userId = :userId AND uc.courses.courseId = :courseId";
			TypedQuery<UserCourse> query = entityManager.createQuery(jpql, UserCourse.class);
			query.setParameter("userId", userId);
			query.setParameter("courseId", courseId);
			return query.getResultList();
		} catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return null; // or throw a custom exception, return an empty list, etc.
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	public int countUserCourse(String courseId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		TypedQuery<Long> query = null;

		try {
			String jpql = "SELECT COUNT(uc) FROM UserCourse uc WHERE uc.courses.courseId = :courseId";
			query = entityManager.createQuery(jpql, Long.class);
			query.setParameter("courseId", courseId);

			Long count = query.getSingleResult();
			return count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

}
