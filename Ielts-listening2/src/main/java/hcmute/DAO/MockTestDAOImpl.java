package hcmute.DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.MockTest;
import hcmute.entity.TopicTest;


public class MockTestDAOImpl extends AbstractDao<MockTest> implements IMockTestDAO {

	public MockTestDAOImpl() {
		super(MockTest.class);
		// TODO Auto-generated constructor stub
	}

	@Override
	
	public List<MockTest> getMockTestByTopicId(String topicId) {
	    EntityManager en = JPAConfig.getEntityManager();
	    try {
	        String jpql = "select m from MockTest m WHERE m.topicTests.topicId = :topicId";
	        TypedQuery<MockTest> q = en.createQuery(jpql, MockTest.class);
	        q.setParameter("topicId", topicId);
	        return q.getResultList();
	    } catch (Exception e) {
	        // Xử lý ngoại lệ (Exception) ở đây
	        e.printStackTrace();
	        return null; // Hoặc trả về danh sách rỗng, hoặc thực hiện xử lý khác tùy theo yêu cầu
	    } finally {
	        en.close(); // Đảm bảo đóng EntityManager trong mệnh đề finally
	    }
	}
	
}
