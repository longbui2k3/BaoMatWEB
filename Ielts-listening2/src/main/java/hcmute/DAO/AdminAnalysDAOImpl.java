package hcmute.DAO;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Course;
import hcmute.entity.User;

public class AdminAnalysDAOImpl implements IAdminAnalysDAO{

	@Override
	public Long countUser() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT COUNT(u) FROM User u WHERE u.account.role = 'user'";
			Query query = enma.createQuery(jpql);
			Long count = (Long) query.getSingleResult();
			return count;
		}
		finally{
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public Long countCourse() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT COUNT(c) FROM Course c";
			Query query = enma.createQuery(jpql);
			Long count = (Long) query.getSingleResult();
			return count;
		}finally {
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public Long sumRevenue() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT SUM(p.cost) FROM Payment p";
			Query query = enma.createQuery(jpql);
			Long count = (Long) query.getSingleResult();
			return count;
		}finally {
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public Long costWithMonth(int month) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT COALESCE(SUM(p.cost), 0) FROM Payment p WHERE MONTH(p.dateBuy) = :month";
			Query query = enma.createQuery(jpql);
			query.setParameter("month", month);
			Long count = (Long) query.getSingleResult();
			return count;
		}finally {
			if (enma != null) {
				enma.close();
	        }
		}
	}


	@Override
	public List<String> userIdDescreaseCost() {
		EntityManager en = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT u.userId FROM User u INNER JOIN u.payment p GROUP BY u.userId ORDER BY SUM(p.cost) DESC";
	        TypedQuery<String> q = en.createQuery(jpql, String.class);
	        return q.getResultList();
	    } finally {
	        if (en != null) {
	            en.close();
	        }
	    }
	}

	@Override
	public List<Long> costDecrease() {
		EntityManager en = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT SUM(p.cost) FROM User u INNER JOIN u.payment p GROUP BY u.userId ORDER BY SUM(p.cost) DESC";
	        TypedQuery<Long> q = en.createQuery(jpql, Long.class);
	        return q.getResultList();
	    } finally {
	        if (en != null) {
	            en.close();
	        }
	    }
	}

	@Override
	public Long countCourseByUserId(String userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT COUNT(uc.user_courseId) FROM UserCourse uc WHERE uc.users.userId = :userId";
			Query query = enma.createQuery(jpql);
			query.setParameter("userId", userId);
			Long count = (Long) query.getSingleResult();
			return count;
		}
		finally{
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public Long countRatingByUserId(String userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT COUNT(el.numberOfStar) FROM EnrrolLesson el WHERE el.users.userId = :userId and el.numberOfStar != 0";
			Query query = enma.createQuery(jpql);
			query.setParameter("userId", userId);
			Long count = (Long) query.getSingleResult();
			return count;
		}
		finally{
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public User findUserByUserId(String userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "select u from User u where u.userId = :userId";
			TypedQuery<User> query = enma.createQuery(jpql, User.class);
			query.setParameter("userId", userId);
			return query.getSingleResult();
		}
		finally{
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public Long sumCostByUserId(String userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT sum(p.cost) FROM Payment p WHERE p.users.userId = :userId";
			Query query = enma.createQuery(jpql);
			query.setParameter("userId", userId);
			Long sum = (Long) query.getSingleResult();
			return sum;
		}
		finally{
			if (enma != null) {
				enma.close();
	        }
		}
	}

	@Override
	public List<Course> listCourseOrderByTime() {
		EntityManager en = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT c FROM Course c ORDER BY c.enrrolmentDate DESC";
	        TypedQuery<Course> q = en.createQuery(jpql, Course.class);
	        return q.getResultList();
	    } finally {
	        if (en != null) {
	            en.close();
	        }
	    }
	}

	
}
