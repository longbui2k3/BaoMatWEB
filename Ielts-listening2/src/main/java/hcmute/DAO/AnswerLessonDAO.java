package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.AnswerLesson;

public class AnswerLessonDAO extends AbstractDao<AnswerLesson> {
	public AnswerLessonDAO() {
		super(AnswerLesson.class);
	}

	public List<AnswerLesson> findAnswerByLesson(String lessonId) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<AnswerLesson> query = null;

		try {
			String jpql = "SELECT a FROM AnswerLesson a WHERE a.lessons.lessonId = ?1";
			query = enma.createQuery(jpql, AnswerLesson.class);
			query.setParameter(1, lessonId);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (enma != null && enma.isOpen()) {
				enma.close();
			}
		}
	}
}
