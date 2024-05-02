package hcmute.services;

import java.util.Date;
import java.util.List;

import hcmute.DAO.EnrolLessonImpl;
import hcmute.DAO.IEnrolLessonDAO;
import hcmute.entity.EnrrolLesson;

public class EnrollLessonServiceImpl implements IEnrollLessonService {
	IEnrolLessonDAO enrollLessonDAO = new EnrolLessonImpl();
	EnrolLessonImpl enDao = new EnrolLessonImpl();

	@Override
	public List<EnrrolLesson> findAll() {
		// TODO Auto-generated method stub
		return enDao.findAll();
	}

	@Override
	public EnrrolLesson findOneById(String enrLessonId) {
		// TODO Auto-generated method stub
		return enDao.findById(enrLessonId);
	}

	@Override
	public void update(EnrrolLesson model) {
		// TODO Auto-generated method stub
		enDao.update(model);
	}

	@Override
	public void delete(String enLessId) throws Exception {

		enDao.delete(enLessId);
	}

	@Override
	public void insert(EnrrolLesson model) {
		// TODO Auto-generated method stub
		enDao.insert(model);
	}

	@Override
	public EnrrolLesson findOneByUser_Lesson(String userId, String lessId) {
		// TODO Auto-generated method stub
		return enrollLessonDAO.findOneByUser_Lesson(userId, lessId);
	}

	@Override
	public EnrrolLesson findByUserIdAndLessonId(String UserId, String LessonId) {
		// TODO Auto-generated method stub
		return enrollLessonDAO.findByUserIdAndLessonId(UserId, LessonId);
	}

	@Override
	public void completeTest(String enrollLessonId) {
		EnrrolLesson enrollLesson = enDao.findOneByIdContainAnsTestAndAnsUser(enrollLessonId);
		System.out.println("keyid = " + enrollLessonId +enrollLesson);
		if (enrollLesson != null) {
			int numberQuestions = enrollLesson.getLessons().getAnswerLesson().size();
			long numberCorrectAnswers = enrollLesson.getAnswerLessonUser().stream() 
					.filter(ansUser -> ansUser.getAnswerLesson().getAnswerKey().equals(ansUser.getAnswerUser()))
					.count();
			System.out.println("key = " + enrollLessonId);
			
			try {
				double score = ((double)numberCorrectAnswers / numberQuestions)*10;
				enrollLesson.setScore(score);
				Date currentDate = new Date(System.currentTimeMillis());
				enrollLesson.setEnrrollmentDate(currentDate);
				enDao.update(enrollLesson);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void resetTest(String enrollLessonId) {
		EnrrolLesson enrollLesson = enDao.findOneByIdContainAnsTestAndAnsUser(enrollLessonId);
		if (enrollLesson != null) {
			double score = -1;
			enrollLesson.setScore(score);
			enDao.update(enrollLesson);
		}
	}

	@Override
	public EnrrolLesson findOneByIdContainAnsTestAndAnsUser(String enrollLessonId) {
		return enDao.findOneByIdContainAnsTestAndAnsUser(enrollLessonId);
	}

	@Override
	public List<EnrrolLesson> findByLesson(String lessonId) {
		// TODO Auto-generated method stub
		return enDao.findByLesson(lessonId);
	}
}
