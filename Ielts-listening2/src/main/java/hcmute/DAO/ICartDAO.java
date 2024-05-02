package hcmute.DAO;

import java.util.List;

import hcmute.entity.Cart;

public interface ICartDAO {
	List<Cart> findByUserId(String userId);
}
