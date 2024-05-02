package hcmute.DAO;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;

import JPAConfig.JPAConfig;
import hcmute.entity.EnrrolTest;

public class EnrollTestDao extends AbstractDao<EnrrolTest>{

	public EnrollTestDao() {
		super(EnrrolTest.class);
	}
	
	public List<EnrrolTest> findByUserIdAndMockTestId(String userId, String mockTestId) {
	    String jpql = "Select enrollTest from EnrrolTest enrollTest where enrollTest.users.userId = :userId and " +
	            "enrollTest.mockTests.testId = :mockTestId";
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        TypedQuery<EnrrolTest> query = enma.createQuery(jpql, EnrrolTest.class);
	        query.setParameter("userId", userId);
	        query.setParameter("mockTestId", mockTestId);
	        return query.getResultList();
	    } finally {
	        if (enma != null) {
	            enma.close();
	        }
	    }
	}
	public List<EnrrolTest> findByMockTestId( String mockTestId) {
	    String jpql = "Select enrollTest from EnrrolTest enrollTest where  " +
	            "enrollTest.mockTests.testId = :mockTestId";
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        TypedQuery<EnrrolTest> query = enma.createQuery(jpql, EnrrolTest.class);
	        
	        query.setParameter("mockTestId", mockTestId);
	        return query.getResultList();
	    } finally {
	        if (enma != null) {
	            enma.close();
	        }
	    }
	}
	public EnrrolTest findByUserIdAndMockTestIdAndDate(String userId, String mockTestId, LocalDateTime date) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT enrollTest FROM EnrrolTest enrollTest WHERE enrollTest.users.userId = :userId "
	                + "AND enrollTest.mockTests.testId = :mockTestId AND enrollTest.enrrollmentDate = :date";
	        TypedQuery<EnrrolTest> query = enma.createQuery(jpql, EnrrolTest.class);
	        query.setParameter("userId", userId);
	        query.setParameter("mockTestId", mockTestId);
	        query.setParameter("date", date);
	        return query.getSingleResult();
	    } catch (Exception e) {
	        // Xử lý ngoại lệ (Exception) ở đây
	        e.printStackTrace();
	        return null; // Hoặc thực hiện xử lý khác tùy theo yêu cầu
	    } finally {
	        enma.close(); // Đảm bảo đóng EntityManager trong mệnh đề finally
	    }
	}
	
	public EnrrolTest findByIdContainAnsTestAndAnswerUser(String enrollTestId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			EnrrolTest enrollTest = enma.find(EnrrolTest.class, enrollTestId);
			if(enrollTest != null) {
				enrollTest.getAnswerUsers().size();
				enrollTest.getMockTests().getListeningParts().size();
			}
			return enrollTest;
		} finally {
			enma.close();
		}
	}
	

	public EnrrolTest findByUserIdAndMockTestIdSoon(String userId, String mockTestId) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT enrollTest FROM EnrrolTest enrollTest WHERE enrollTest.users.userId = :userId "
	                + "AND enrollTest.mockTests.testId = :mockTestId"
	                + " AND enrollTest.enrrollmentDate = ("
	                + "SELECT MAX(enrollTest2.enrrollmentDate) FROM EnrrolTest enrollTest2 "
	                + "WHERE enrollTest2.users.userId = :userId AND enrollTest2.mockTests.testId = :mockTestId)";
	        TypedQuery<EnrrolTest> query = enma.createQuery(jpql, EnrrolTest.class);
	        query.setParameter("userId", userId);
	        query.setParameter("mockTestId", mockTestId);
	        return query.getSingleResult();
	    } catch (Exception e) {
	        // Xử lý ngoại lệ (Exception) ở đây
	        e.printStackTrace();
	        return null; // Hoặc thực hiện xử lý khác tùy theo yêu cầu
	    } finally {
	        enma.close(); // Đảm bảo đóng EntityManager trong mệnh đề finally
	    }
	}

	public EnrrolTest findEnTestProcess(String userId) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT enrollTest FROM EnrrolTest enrollTest WHERE enrollTest.users.userId = :userId "
	                + "AND enrollTest.score < 0 "
	                + "AND enrollTest.enrrollmentDate = ("
	                + "SELECT MAX(enrollTest2.enrrollmentDate) FROM EnrrolTest enrollTest2 "
	                + "WHERE enrollTest2.users.userId = :userId AND enrollTest2.score < 0)";
	        TypedQuery<EnrrolTest> query = enma.createQuery(jpql, EnrrolTest.class);
	        query.setParameter("userId", userId);
	        return query.getSingleResult();
	    } catch (Exception e) {
	        // Xử lý ngoại lệ (Exception) ở đây
	        e.printStackTrace();
	        return null; // Hoặc thực hiện xử lý khác tùy theo yêu cầu
	    } finally {
	        enma.close(); // Đảm bảo đóng EntityManager trong mệnh đề finally
	    }
	}
}
