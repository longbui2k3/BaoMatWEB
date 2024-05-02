package hcmute.services;

import java.util.List;

import hcmute.DAO.RepCommentDaoImpl;
import hcmute.entity.RepComment;

public class RepCommentServiceImpl implements IRepCommentService {

	RepCommentDaoImpl repDao = new RepCommentDaoImpl()	;
	@Override
	public List<RepComment> findAll() {
		return repDao.findAll();
	}

	@Override
	public RepComment findOneById(String repCommentId) {
		return repDao.findById(repCommentId);
	}

	@Override
	public void insert(RepComment rep) {
		repDao.insert(rep);
	}

}
