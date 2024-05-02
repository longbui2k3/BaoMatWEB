package hcmute.services;

import hcmute.DAO.AccountDAOImpl;
import hcmute.DAO.IAccountDAO;
import hcmute.entity.Account;
import hcmute.entity.User;

public class AccountServiceImpl implements IAccountServices {

	IAccountDAO accountDAO = new AccountDAOImpl();
	AccountDAOImpl accountAbs = new AccountDAOImpl();

	@Override
	public String SignUp(Account account) {
		return accountDAO.SignUp(account);
	}

	@Override
	public User Login(Account account) {
		// TODO Auto-generated method stub
		return accountDAO.Login(account);
	}

	@Override
	public Account findByID(String id) {
		// TODO Auto-generated method stub
		return accountAbs.findById(id);
	}

	@Override
	public void update(Account account) {
		// TODO Auto-generated method stub
		accountAbs.update(account);
	}

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return accountDAO.getUserByUsername(username);
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		return accountDAO.getUserByEmail(email);
	}

	@Override
	public boolean checkExistEmail(String email) {
		// TODO Auto-generated method stub
		return accountDAO.checkExistEmail(email);
	}

	@Override
	public boolean checkExistUsername(String username) {
		// TODO Auto-generated method stub
		return accountDAO.checkExistUsername(username);
	}

	@Override
	public Account findByUserName(String userName) {
		// TODO Auto-generated method stub
		return accountDAO.findByUserName(userName);
	}

}
