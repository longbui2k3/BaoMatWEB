package hcmute.services;

import java.util.List;

import hcmute.entity.MockTest;

public interface IMockTestService {
	
	
	List <MockTest> getMockTestByTopicId(String id);
	void insert(MockTest mockTest);
	void update(MockTest mockTest);
	void delete(Object mockTest) throws Exception;
	MockTest findById(String testId);
	Long countAll();
	List<MockTest> findAll();
	List<MockTest> findAll(boolean all, int firstResult, int maxResult);
	

}

