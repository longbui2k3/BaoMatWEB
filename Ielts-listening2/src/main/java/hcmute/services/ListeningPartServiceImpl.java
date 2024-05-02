package hcmute.services;

import java.util.List;

import hcmute.DAO.ListeningPartDao;
import hcmute.entity.AnswerTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;

public class ListeningPartServiceImpl implements IListeningPartService {

	ListeningPartDao dao = new ListeningPartDao();

	@Override
	public void insert(ListeningPart listeningPart) {
		dao.insert(listeningPart);
	}

	@Override
	public void update(ListeningPart listeningPart) {
		dao.update(listeningPart);
	}

	@Override
	public void delete(Object partId) throws Exception {
		dao.delete(partId);
	}

	@Override
	public ListeningPart findById(String listeningPartId) {
		return dao.findById(listeningPartId);
	}

	@Override
	public Long countAll() {
		return dao.countAll();
	}

	@Override
	public List<ListeningPart> findAll() {
		return dao.findAll();
	}

	@Override
	public List<ListeningPart> findAll(boolean all, int firstResult, int maxResult) {
		return dao.findAll(all, firstResult, maxResult);
	}

	@Override
	public List<ListeningPart> findByMockTestId(String mockTestId) {
		return dao.findByMockTestId(mockTestId);
	}

	@Override
	public ListeningPart findByTestIDandNumber(MockTest mockTest, int number) {
		// TODO Auto-generated method stub
		return dao.findByTestIDandNumber(mockTest, number);
	}

}
