package com.skilldistillery.mvctrailmixer.data;

import com.skilldistillery.trailmixer.entities.User;

public interface UserDAO {
	  User getUserByUserNameAndPassword(String userName, String password);
	  User findUserById(int userId);
	  User updateUser(int userId, User user);

}
