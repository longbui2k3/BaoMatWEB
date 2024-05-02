package hcmute.services;

import java.util.List;

import hcmute.entity.MockTest;
import hcmute.entity.TopicTest;

public interface ITopicTestService {
	List<TopicTest> findAll(String searchStr, int tab);
	List<TopicTest> findAll(int page, int pagesize, String searchStr, int tab);
	List<TopicTest> getAllTopicTest();
	List<TopicTest> getAllTopicTest(int page, int pagesize);
	TopicTest getOneTopicTest(String topicID);
	void addTopic(TopicTest topic);
	void deleteTopic(String topicID) throws Exception;
	void updateTopic(TopicTest newTopicID) throws Exception;
	List<TopicTest>  getAllTopic();
	TopicTest findById(String topicId);
}
