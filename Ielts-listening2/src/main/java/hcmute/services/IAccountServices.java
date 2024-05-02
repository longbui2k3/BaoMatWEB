package hcmute.services;

import hcmute.entity.Account;
import hcmute.entity.User;

public interface IAccountServices {
	String SignUp(Account account);
	User Login(Account account);
	Account findByID(String id);
	void update(Account account);
	User getUserByUsername(String username);
	User getUserByEmail(String email);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	Account findByUserName (String userName) ;
}
