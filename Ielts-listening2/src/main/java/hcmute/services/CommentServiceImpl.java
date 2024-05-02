package hcmute.services;

import java.util.List;

import hcmute.DAO.CommentDaoImpl;
import hcmute.entity.CommentLesson;

public class CommentServiceImpl implements ICommentService {

	CommentDaoImpl cmDao = new CommentDaoImpl();
	@Override
	public List<CommentLesson> findAll() {
		return cmDao.findAll();
	}

	@Override
	public CommentLesson findOneById(String commentId) {
		return cmDao.findById(commentId);
	}


	@Override
	public void insert(CommentLesson cmt) {
		cmDao.insert(cmt);
	}

	@Override
	public List<CommentLesson> getCommentLessonByLesson(String lessonId) {
		// TODO Auto-generated method stub
		return cmDao.getCommentLessonByLesson(lessonId);
	}
	
	

}
