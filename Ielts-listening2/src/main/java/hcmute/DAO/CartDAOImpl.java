package hcmute.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import JPAConfig.JPAConfig;
import hcmute.entity.Cart;

public class CartDAOImpl extends AbstractDao<Cart> implements ICartDAO {

	public CartDAOImpl() {
		super(Cart.class);
		// TODO Auto-generated constructor stub
	}
	@Override
	public List<Cart> findByUserId(String userId) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    try {
	        String jpql = "SELECT c FROM Cart c WHERE c.users.userId = :userId";
	        TypedQuery<Cart> query = enma.createQuery(jpql, Cart.class);
	        query.setParameter("userId", userId);
	        return query.getResultList();
	    } finally {
	        if (enma != null) {
	            enma.close();
	        }
	    }
	}

}
