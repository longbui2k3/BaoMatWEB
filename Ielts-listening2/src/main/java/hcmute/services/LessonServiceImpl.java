package hcmute.services;

import java.util.List;

import hcmute.DAO.AbstractDao;
import hcmute.DAO.IAdminLessonDAO;

import hcmute.DAO.LessonDAOImpl;
import hcmute.entity.Lesson;

public class LessonServiceImpl implements ILessonService {
	IAdminLessonDAO lessonDAO = new LessonDAOImpl();
	LessonDAOImpl lessonAbstract = new LessonDAOImpl();
	
	@Override
	public List<Lesson> findLessonByCourse(String courseId) {
		return lessonDAO.findLessonByCourse(courseId) ;
	}

	@Override
	public Lesson findOneById(String lessonId) {
		return lessonAbstract.findById(lessonId);
	}

	@Override
	public void delete(String lessonID) {
		
		 try {
			lessonAbstract.delete(lessonID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void insert(Lesson lesson) {
		lessonAbstract.insert(lesson);
		
	}

	public void update(Lesson lesson) {
		lessonAbstract.update(lesson);
	}

	@Override
	public Lesson getNewLesson() {
		return lessonDAO.getNewLesson();
	}
	
}
