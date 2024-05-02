package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Course;
import hcmute.entity.Lesson;


public class AdminLessonDAOimpl extends AbstractDao<Lesson> implements IAdminLessonDAO {
	
	public AdminLessonDAOimpl() {
		super(Lesson.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Lesson> findLessonByCourse(String courseid) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT l FROM Lesson l WHERE l.courses.courseId = ?1";
	        TypedQuery<Lesson> query = enma.createQuery(jpql, Lesson.class);
	        query.setParameter(1, courseid);
	        return query.getResultList();
	    } finally {
	        if (enma != null) {
	            enma.close();
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
