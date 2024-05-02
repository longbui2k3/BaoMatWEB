package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.EnrrolLesson;

public class EnrolLessonImpl extends AbstractDao<EnrrolLesson> implements IEnrolLessonDAO {

	public EnrolLessonImpl() {
		super(EnrrolLesson.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public EnrrolLesson findByUserIdAndLessonId(String userId, String lessonId) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        System.out.println(userId + " " + lessonId);
	        String jpql = "SELECT el FROM EnrrolLesson el LEFT JOIN FETCH el.answerLessonUser WHERE el.users.userId = :userId AND el.lessons.lessonId = :lessonId";
	        TypedQuery<EnrrolLesson> query = enma.createQuery(jpql, EnrrolLesson.class);
	        query.setParameter("userId", userId);
	        query.setParameter("lessonId", lessonId);
	        List<EnrrolLesson> list = query.getResultList();
	        if (list.size() == 0)
	            return null;
	        return query.getSingleResult();
	    } finally {
	        if (enma != null) {
	            enma.close();
	        }
	    }
	}

	@Override
	public EnrrolLesson findOneByUser_Lesson(String userId, String lessId) {
		System.out.println(userId + " " + lessId);
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT e FROM EnrrolLesson e WHERE e.users.userId = :userId AND e.lessons.lessonId = :lessId";
			TypedQuery<EnrrolLesson> query = enma.createQuery(jpql, EnrrolLesson.class);
			query.setParameter("userId", userId);
			query.setParameter("lessId", lessId);
			List<EnrrolLesson> list = query.getResultList();
			if (list.size() == 0)
				return null;
			return list.get(0);
		} catch (Exception e) {
			return null;
		} finally {
			enma.close();
		}

	}
	
	public List<EnrrolLesson> findByLesson(String lessonId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT e FROM EnrrolLesson e WHERE e.lessons.lessonId = :lessId";
			TypedQuery<EnrrolLesson> query = enma.createQuery(jpql, EnrrolLesson.class);
			query.setParameter("lessId", lessonId);
			List<EnrrolLesson> list = query.getResultList();
			if (list.size() == 0)
				return null;
			return query.getResultList();
		} catch (Exception e) {
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public EnrrolLesson findOneByIdContainAnsTestAndAnsUser(String enrolLessonId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			EnrrolLesson enrollLesson = enma.find(EnrrolLesson.class, enrolLessonId);
			if (enrollLesson != null) {
				enrollLesson.getAnswerLessonUser().size();
				enrollLesson.getLessons().getAnswerLesson().size();
			}
			return enrollLesson;
		} finally {
			enma.close();
		}
	}
}
