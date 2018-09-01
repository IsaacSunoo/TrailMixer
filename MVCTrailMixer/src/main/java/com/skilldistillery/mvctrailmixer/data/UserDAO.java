package com.skilldistillery.mvctrailmixer.data;

import com.skilldistillery.trailmixer.entities.User;

public interface UserDAO {
	  User getUserByUserNameAndPassword(String userName, String password);
	  User findUserById(int userId);
	  User updateUser(User user);
	  boolean deleteUser(int userId);
	  User addUser(User user);

}
