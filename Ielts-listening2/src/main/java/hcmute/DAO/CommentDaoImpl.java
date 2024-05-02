package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.CommentLesson;

public class CommentDaoImpl extends AbstractDao<CommentLesson> implements ICommentDao {

	public CommentDaoImpl() {
		super(CommentLesson.class);
	}

	public List<CommentLesson> getCommentLessonByLesson(String lessonId) {
		String jpql = "Select c from CommentLesson c where c.lessons.lessonId = :lessonId";
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<CommentLesson> query = enma.createQuery(jpql, CommentLesson.class);
			query.setParameter("lessonId", lessonId);
			return query.getResultList();
		} finally {
			if (enma != null) {
				enma.close();
			}
		}
	}
}
