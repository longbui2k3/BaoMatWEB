package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.AnswerTest;

public class AnswerTestDao extends AbstractDao<AnswerTest> {

	public AnswerTestDao() {
		super(AnswerTest.class);
	}

	public void insertAnswerTest(AnswerTest answerTest) {
		System.out.println("Number : " + answerTest.getNumber() + " " + answerTest.getListeningParts().getPartId());
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(answerTest);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			enma.close();
		}
	}

	public List<AnswerTest> findByPartId(String partId) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		try {
			String jpql = "SELECT at FROM AnswerTest at WHERE at.listeningParts.partId = :partId";
			TypedQuery<AnswerTest> query = entityManager.createQuery(jpql, AnswerTest.class);
			query.setParameter("partId", partId);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}

}
