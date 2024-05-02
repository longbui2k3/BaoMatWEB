package hcmute.DAO;

import java.util.List;
import hcmute.entity.MockTest;

public interface IMockTestDAO {
	List<MockTest> getMockTestByTopicId(String topicId);
}
