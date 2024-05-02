package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.AnswerTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;
import hcmute.entity.TopicTest;

public class ListeningPartDao extends AbstractDao<ListeningPart> {

	public ListeningPartDao() {
		super(ListeningPart.class);
	}

	public List<ListeningPart> findByMockTestId(String mockTestId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT l FROM ListeningPart l WHERE l.mockTests.testId = :mockTestId";
			TypedQuery<ListeningPart> query = entityManager.createQuery(jpql, ListeningPart.class);
			query.setParameter("mockTestId", mockTestId);
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

	public ListeningPart findByTestIDandNumber(MockTest mockTest, int number) {
		System.out.println(mockTest.getTestId() + " " + number);
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT lp FROM ListeningPart lp WHERE lp.mockTests.testId = :mockTest AND lp.number = :number";
			TypedQuery<ListeningPart> query = entityManager.createQuery(jpql, ListeningPart.class);
			query.setParameter("mockTest", mockTest.getTestId());
			query.setParameter("number", number);
			// Use getResultList() instead of getSingleResult() to handle multiple results
			List<ListeningPart> resultList = query.getResultList();

			if (!resultList.isEmpty()) {
				// If there are results, return the first one
				return resultList.get(0);
			} else {
				return null; // Handle case where no result is found
			}
		} finally {
			entityManager.close();
		}
	}

}
