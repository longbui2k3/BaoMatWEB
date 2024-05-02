package hcmute.services;

import java.util.List;

import hcmute.DAO.ITopicTestDAO;
import hcmute.DAO.TopicTestDAOImpl;
import hcmute.entity.TopicTest;

public class TopicTestServiceImpl implements ITopicTestService{

	TopicTestDAOImpl topicDAO = new TopicTestDAOImpl();


	ITopicTestDAO topicTestDAO = new TopicTestDAOImpl();
	IMockTestService mockTestService = new MockTestServiceImpl();
	@Override
	public List<TopicTest> findAll(String searchStr, int tab) {
		return topicTestDAO.findAll(searchStr, tab);
	}
	@Override
	public List<TopicTest> findAll(int page, int pagesize, String searchStr, int tab) {
		return topicTestDAO.findAll(page, pagesize, searchStr, tab);
	}

	@Override
	public List<TopicTest> getAllTopicTest() {
		// TODO Auto-generated method stub
		return topicDAO.findAll();
	}

	@Override
	public TopicTest getOneTopicTest(String topicID) {
		return topicDAO.findById(topicID);
	}

	@Override
	public void addTopic(TopicTest topic) {
		topicDAO.insert(topic);;
	}


	@Override
	public void deleteTopic(String topicID) throws Exception {
		topicDAO.delete(topicID);
	}

	@Override
	public void updateTopic(TopicTest newTopicID) throws Exception {
		topicDAO.update(newTopicID);
	}
	@Override
	public List<TopicTest> getAllTopicTest(int page, int pagesize) {
		// TODO Auto-generated method stub
		return topicDAO.getAllTopicTest(page, pagesize);
	}
	@Override
	public List<TopicTest> getAllTopic() {
		// TODO Auto-generated method stub
		return topicDAO.getAllTopic();
	}
	public TopicTest findById(String topicId)
	{
		return topicDAO.findById(topicId);
	}

}
