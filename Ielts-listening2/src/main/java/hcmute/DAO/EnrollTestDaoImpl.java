package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.EnrrolTest;

public class EnrollTestDaoImpl extends AbstractDao<EnrrolTest> implements IEnrollTestDAO {

	public EnrollTestDaoImpl() {
		super(EnrrolTest.class);
	}

	@Override
	public List<EnrrolTest> getEnrollTestByUserId(String userId, String topicId) {
		EntityManager en = JPAConfig.getEntityManager();
		TypedQuery<EnrrolTest> q = null;

		try {
			String jpql = "SELECT e " + "FROM EnrrolTest e " + "WHERE e.users.userId = :userId "
					+ "AND e.mockTests.topicTests.topicId = :topicId " + "AND e.score = (" + "   SELECT MAX(et.score) "
					+ "   FROM EnrrolTest et " + "   WHERE et.mockTests.testId = e.mockTests.testId "
					+ "   AND et.users.userId = :userId " + "   AND et.mockTests.topicTests.topicId = :topicId" + ")";

			q = en.createQuery(jpql, EnrrolTest.class);
			q.setParameter("userId", userId);
			q.setParameter("topicId", topicId);
			return q.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (en != null && en.isOpen()) {
				en.close();
			}
		}
	}

}
