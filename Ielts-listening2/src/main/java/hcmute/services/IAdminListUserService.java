package hcmute.services;

import java.util.List;

import hcmute.entity.User;

public interface IAdminListUserService {
	List<User> findAllUser();
	User findUserById(String userId);
}
