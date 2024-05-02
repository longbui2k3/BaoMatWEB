package hcmute.services;

import java.util.List;

import hcmute.entity.AnswerTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;

public interface IListeningPartService {
	void insert(ListeningPart listeningPart);

	void update(ListeningPart listeningPart);

	void delete(Object partId) throws Exception;

	ListeningPart findById(String listeningPartId);

	Long countAll();

	List<ListeningPart> findAll();

	List<ListeningPart> findAll(boolean all, int firstResult, int maxResult);

	List<ListeningPart> findByMockTestId(String mockTestId);

	ListeningPart findByTestIDandNumber(MockTest mockTest, int number);
}
