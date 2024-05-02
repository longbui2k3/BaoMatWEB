package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.AnswerLesson;

public class AnswerLessonDaoImpl extends AbstractDao<AnswerLesson> implements IAnswerLessonDao {

	public AnswerLessonDaoImpl() {
		super(AnswerLesson.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AnswerLesson> findByLessonId(String lessonId) {
		String jpql = "Select answerLesson from AnswerLesson answerLesson where  " +
	            "answerLesson.lessons.lessonId = :lessonId";
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        TypedQuery<AnswerLesson> query = enma.createQuery(jpql, AnswerLesson.class);
	        query.setParameter("lessonId", lessonId);
	        return query.getResultList();
	    } finally {
	        if (enma != null) {
	            enma.close();
	        }
	    }
	}
}
