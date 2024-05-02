package hcmute.services;

import java.util.List;

import hcmute.DAO.IMockTestDAO;
import hcmute.DAO.MockTestDAOImpl;
import hcmute.entity.MockTest;

public class MockTestServiceImpl implements IMockTestService {

	MockTestDAOImpl mockDao = new MockTestDAOImpl();
	public List<MockTest> getMockTestByTopicId(String id) {
		return mockDao.getMockTestByTopicId(id);
	}
	@Override
	public void insert(MockTest mockTest) {
		mockDao.insert(mockTest); 
	}
	@Override
	public void update(MockTest mockTest) {
		mockDao.update(mockTest);
	}
	@Override
	public void delete(Object mockTest) throws Exception {
		mockDao.delete(mockTest);
	}
	@Override
	public MockTest findById(String testId) {
		return mockDao.findById(testId);
	}
	@Override
	public Long countAll() {
		return mockDao.countAll();
	}
	@Override
	public List<MockTest> findAll() {
		return mockDao.findAll();
	}
	@Override
	public List<MockTest> findAll(boolean all, int firstResult, int maxResult) {
		return mockDao.findAll(all,firstResult,maxResult);
	}

}
