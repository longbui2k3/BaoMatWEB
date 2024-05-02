package hcmute.services;

import java.util.List;

import hcmute.DAO.EnrollTestDaoImpl;
import hcmute.DAO.ListeningPartDao;
import hcmute.DAO.MockTestDAOImpl;
import hcmute.entity.EnrrolTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;
import hcmute.entity.User;

public class EnrollTestServiceImpl implements IEnrollTestService{

	private EnrollTestDaoImpl enrollTestDao = new EnrollTestDaoImpl();
	@Override
	public void insert(EnrrolTest enrollTest) {
		enrollTestDao.insert(enrollTest);
	}

	@Override
	public void update(EnrrolTest enrollTest) {
		enrollTestDao.update(enrollTest);
	}

	@Override
	public void delete(EnrrolTest enrollTest) {
		try {
			enrollTestDao.delete(enrollTest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public EnrrolTest findById(String enrollTestId) {
		return enrollTestDao.findById(enrollTestId);
	}

	

	@Override
	public Long countAll() {
		return enrollTestDao.countAll();
	}

	@Override
	public List<EnrrolTest> findAll() {
		return enrollTestDao.findAll();
	}

	@Override
	public List<EnrrolTest> findAll(boolean all, int firstResult, int maxResult) {
		return enrollTestDao.findAll(all,firstResult,maxResult);
	}

	@Override
	public List<EnrrolTest> getEnrollTestByUserId(String userId ,String topicId) {
		// TODO Auto-generated method stub
		return enrollTestDao.getEnrollTestByUserId(userId,topicId);
	}
}
