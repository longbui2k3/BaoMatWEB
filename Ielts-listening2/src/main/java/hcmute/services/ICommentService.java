package hcmute.services;

import java.util.List;

import hcmute.entity.CommentLesson;

public interface ICommentService {
	List<CommentLesson> findAll();
	CommentLesson findOneById(String commentId);
	void insert(CommentLesson cmt);
	List<CommentLesson> getCommentLessonByLesson(String lessonId);
}
