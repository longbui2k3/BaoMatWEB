package hcmute.DAO;

import java.util.List;

import hcmute.entity.EnrrolTest;

public interface IEnrollTestDAO {
	List <EnrrolTest> getEnrollTestByUserId(String userid,String topicId);
}
