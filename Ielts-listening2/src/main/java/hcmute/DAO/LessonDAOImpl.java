package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Course;
import hcmute.entity.Lesson;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;

public class LessonDAOImpl extends AbstractDao<Lesson> implements IAdminLessonDAO {

	public LessonDAOImpl() {
		super(Lesson.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Lesson> findLessonByCourse(String courseId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT l FROM Lesson l WHERE l.courses.courseId = :courseId";
			TypedQuery<Lesson> query = entityManager.createQuery(jpql, Lesson.class);
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
	
	public Lesson getNewLesson() {
		/* System.out.println(course.getCourseId() + " " + number); */
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT l FROM Lesson l ORDER BY CAST(SUBSTRING(lessonId, 7) AS int) DESC";
			TypedQuery<Lesson> query = enma.createQuery(jpql, Lesson.class);
			query.setMaxResults(1);
			List<Lesson> resultList = query.getResultList();

			if (!resultList.isEmpty()) {
				// If there are results, return the first one
				return resultList.get(0);
			} else {
				return null; // Handle case where no result is found
			}
		} finally {
			enma.close();
		}
	}

}
