package hcmute.DAO;

import java.util.List;
import hcmute.entity.TopicTest;

public interface ITopicTestDAO {
	List<TopicTest> findAll(String searchStr, int tab);
	List<TopicTest> findAll(int page, int pagesize, String searchStr, int tab);
	List<TopicTest> getAllTopicTest();
	List<TopicTest> getAllTopicTest(int page, int pagesize);
	List<TopicTest>  getAllTopic();
}
