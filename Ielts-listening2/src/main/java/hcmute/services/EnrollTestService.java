package hcmute.services;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import hcmute.DAO.EnrollTestDao;
import hcmute.DAO.ListeningPartDao;
import hcmute.DAO.MockTestDAOImpl;
import hcmute.entity.EnrrolTest;
import hcmute.entity.ListeningPart;
import hcmute.entity.MockTest;
import hcmute.entity.User;

public class EnrollTestService {

	private EnrollTestDao enrollTestDao = new EnrollTestDao();

	public void insert(EnrrolTest enrollTest) {
		enrollTestDao.insert(enrollTest);
	}

	public void update(EnrrolTest enrollTest) {
		enrollTestDao.update(enrollTest);
	}

	public void delete(EnrrolTest enrollTest) throws Exception {
		enrollTestDao.delete(enrollTest);
	}

	public EnrrolTest findById(String enrollTestId) {
		return enrollTestDao.findById(enrollTestId);
	}

	public Long countAll() {
		return enrollTestDao.countAll();
	}

	public List<EnrrolTest> findAll() {
		return enrollTestDao.findAll();
	}

	public List<EnrrolTest> findAll(boolean all, int firstResult, int maxResult) {
		return enrollTestDao.findAll(all, firstResult, maxResult);
	}

	public double completeTest(String enrrolTestId) {
		EnrrolTest newEnrrolTest = enrollTestDao.findById(enrrolTestId);
		if (newEnrrolTest != null) {
			try {
				long numberOfCorrectAnswer = calcNumberOfCorrectAnswers(enrrolTestId);
				// Bảng điểm IELTS theo barem cụ thể
				double[] scoreTable = { 0, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0 };
				// Bảng câu đúng tương ứng với từng mức điểm
				int[] correctAnswersTable = { 0, 3, 5, 7, 10, 13, 16, 20, 23, 27, 30, 33, 35, 37, 39 };
				double score = 0;
				// Tìm mức điểm tương ứng với số câu đúng
				for (int i = scoreTable.length - 1; i >= 0; i--) {
					if (numberOfCorrectAnswer >= correctAnswersTable[i]) {
						score = scoreTable[i];
						break;
					}
				}
				newEnrrolTest.setScore(score);
				enrollTestDao.update(newEnrrolTest);
				return score;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public long calcNumberOfCorrectAnswers(String enrollTestId) {
		EnrrolTest enrollTest = enrollTestDao.findByIdContainAnsTestAndAnswerUser(enrollTestId);
		long number = 0;
		if (enrollTest != null) {
			number = enrollTest.getAnswerUsers().stream()
					.filter(answerUser -> answerUser.getAnswer().equals(answerUser.getAnswerTest().getAnswerKey()))
					.count();
		}
		return number;
	}

	public long calcNumberOfQuestTion(String enrollTestId) {
		EnrrolTest enrollTest = enrollTestDao.findByIdContainAnsTestAndAnswerUser(enrollTestId);
		long number = 0;
		if (enrollTest != null) {
			number = enrollTest.getMockTests().getListeningParts().stream().map(part -> part.getAnswerTests().size())
					.mapToLong(Integer::intValue).sum();
		}
		return number;
	}

	public List<EnrrolTest> findByUserIdAndMockTestId(String userId, String mockTestId) {
		return enrollTestDao.findByUserIdAndMockTestId(userId, mockTestId);
	}

	public List<EnrrolTest> findByMockTestId(String mockTestId) {
		return enrollTestDao.findByMockTestId(mockTestId);
	}

	public EnrrolTest findByUserIdAndMockTestIdAndDate(String userId, String mockTestId, LocalDateTime date) {
		return enrollTestDao.findByUserIdAndMockTestIdAndDate(userId, mockTestId, date);
	}

	public EnrrolTest findByUserIdAndMockTestIdSoon(String userId, String mockTestId) {
		return enrollTestDao.findByUserIdAndMockTestIdSoon(userId, mockTestId);
	}

	public EnrrolTest findEnTestProcess(String userId) {
		return enrollTestDao.findEnTestProcess(userId);
	}

	public void completeExpiredTest(String userId) {
		List<EnrrolTest> enrollTests = enrollTestDao.findAll();
		int timeTest = 40 * 60;
		enrollTests.forEach(enrollTest -> {
			if (enrollTest.getUsers().getUserId().equals(userId)) {
				Date currentDate = new Date(System.currentTimeMillis());
				Date enrollmentDate = enrollTest.getEnrrollmentDate();
				Date endingEnrollmentDate = new Date(enrollmentDate.getTime() + timeTest * 1000);
				System.out.println(endingEnrollmentDate);
				if (currentDate.after(endingEnrollmentDate) && enrollTest.getScore() < 0) {
					completeTest(enrollTest.getEnrrolId());
				}
			}
		});
	}

	public EnrrolTest findByIdContainAnsTestAndAnswerUser(String enrollTestId) {
		return enrollTestDao.findByIdContainAnsTestAndAnswerUser(enrollTestId);
	}
}
