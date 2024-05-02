package hcmute.services;

import java.util.List;

import hcmute.entity.EnrrolTest;

public interface IEnrollTestService {
	void insert(EnrrolTest enrollTest);
	void update(EnrrolTest enrollTest);
	void delete(EnrrolTest enrollTest);
	EnrrolTest findById(String enrollTestId);
	Long countAll();
	List<EnrrolTest> findAll();
	List<EnrrolTest> findAll(boolean all, int firstResult, int maxResult);
	List <EnrrolTest> getEnrollTestByUserId(String userId,String topicId);
}
