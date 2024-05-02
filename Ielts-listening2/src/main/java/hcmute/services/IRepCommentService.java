package hcmute.services;

import java.util.List;

import hcmute.entity.RepComment;

public interface IRepCommentService {
	List<RepComment> findAll();
	RepComment findOneById(String repCommentId);
	void insert(RepComment rep);
}
