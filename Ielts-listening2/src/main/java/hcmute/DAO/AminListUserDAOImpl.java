package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Course;
import hcmute.entity.Lesson;
import hcmute.entity.User;

public class AminListUserDAOImpl extends AbstractDao<User> implements IAdminListUserDAO{

	
	public AminListUserDAOImpl() {
		super(User.class);
	}
	

}
