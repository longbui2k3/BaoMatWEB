package hcmute.DAO;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Course;
import hcmute.entity.EnrrolLesson;
import hcmute.entity.User;
import hcmute.entity.UserCourse;

public class UserDAOImpl extends AbstractDao<User> implements IUserDAO {

	public UserDAOImpl() {
		super(User.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean findDuplicateEmail(String email, String userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT u from User u where u.email = :email and u.userId != :userId";
		TypedQuery<User> query = enma.createQuery(jpql, User.class);
		query.setParameter("email", email);
		query.setParameter("userId", userId);
		if (query.getResultList().size() > 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean findDuplicatePhone(String phoneNum, String userId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT u from User u where u.phoneNumber = :phoneNumber and u.userId != :userId";
			TypedQuery<User> query = entityManager.createQuery(jpql, User.class);
			query.setParameter("phoneNumber", phoneNum);
			query.setParameter("userId", userId);
			if (query.getResultList().size() > 0) {
				return false;
			}
			return true;
		} catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return false; // or throw a custom exception, return a default value, etc.
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	@Override
	public Long countCourseByUserId(String userId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT COUNT(uc) FROM UserCourse uc WHERE uc.users.userId = :userId";
			Query query = entityManager.createQuery(jpql);
			query.setParameter("userId", userId);
			Long count = (Long) query.getSingleResult();
			return count;
		} catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return 0L; // or throw a custom exception, return a default value, etc.
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	@Override
	public List<UserCourse> findAllUserCourseByUserId(String userId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT uc FROM UserCourse uc WHERE uc.users.userId = :userId";
			TypedQuery<UserCourse> query = entityManager.createQuery(jpql, UserCourse.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		} catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return Collections.emptyList(); // or throw a custom exception, return an empty list, etc.
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	@Override
	public List<Double> findAllEnrrolTestScoreByUserId(String userId) {
		EntityManager en = JPAConfig.getEntityManager();
		try {
			String jpql = "select e.score from EnrrolTest e where e.users.userId = :userId";
			TypedQuery<Double> query = en.createQuery(jpql, Double.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		}
		catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return Collections.emptyList(); // or throw a custom exception, return an empty list, etc.
		} finally {
			if (en != null && en.isOpen()) {
				en.close();
			}
		}
	}

	@Override
	public List<EnrrolLesson> findAllEnrrolLessonByUserId(String userId) {
		EntityManager en = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT er FROM EnrrolLesson er WHERE er.users.userId = :userId";
			TypedQuery<EnrrolLesson> query = en.createQuery(jpql, EnrrolLesson.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		}catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return Collections.emptyList(); // or throw a custom exception, return an empty list, etc.
		} finally {
			if (en != null && en.isOpen()) {
				en.close();
			}
		}
	}

	@Override
	public List<String> findAllTestNamefromUserId(String userId) {
		EntityManager en = JPAConfig.getEntityManager();
		try {
			String jpql = "select mt.testName from MockTest mt join EnrrolTest et on mt.testId = et.mockTests.testId where et.users.userId = :userId";
			TypedQuery<String> query = en.createQuery(jpql, String.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		}catch (Exception e) {
			// Handle your exception (log, rethrow, etc.)
			e.printStackTrace(); // replace with proper logging
			return Collections.emptyList(); // or throw a custom exception, return an empty list, etc.
		} finally {
			if (en != null && en.isOpen()) {
				en.close();
			}
		}
	}

}
