package hcmute.services;

import java.util.List;

import hcmute.entity.Cart;

public interface ICartService {
	List<Cart> findByUserId(String userId);

	void insert(Cart cart);

	void delete(Object cartId);

	void update(Cart cart);
}
