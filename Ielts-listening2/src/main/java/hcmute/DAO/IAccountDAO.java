package hcmute.DAO;

import hcmute.entity.Account;
import hcmute.entity.User;

public interface IAccountDAO {
	String SignUp(Account account);

	User Login(Account account);


	User getUserByUsername(String email);

	User getUserByEmail(String email);

	boolean checkExistEmail(String email);

	boolean checkExistUsername(String username);

	Account findByUserName(String userName);
}
