package hcmute.DAO;

import java.util.List;

import hcmute.entity.CommentLesson;

public interface ICommentDao {
	List<CommentLesson> getCommentLessonByLesson(String lessonId);
}
