package hcmute.services;

import java.util.List;

import hcmute.DAO.CartDAOImpl;
import hcmute.DAO.ICartDAO;
import hcmute.entity.Cart;

public class CartServiceImpl implements ICartService {
	ICartDAO cartDAO = new CartDAOImpl();
	CartDAOImpl cartAbs = new CartDAOImpl();

	@Override
	public List<Cart> findByUserId(String userId) {
		// TODO Auto-generated method stub
		return cartDAO.findByUserId(userId);
	}

	@Override
	public void insert(Cart cart) {
		cartAbs.insert(cart);

	}

	@Override
	public void delete(Object cartId) {
		try {
			cartAbs.delete(cartId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void update(Cart cart) {
		cartAbs.update(cart);
		
	}

}
