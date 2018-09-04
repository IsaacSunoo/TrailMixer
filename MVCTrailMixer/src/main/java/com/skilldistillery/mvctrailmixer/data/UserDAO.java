package com.skilldistillery.mvctrailmixer.data;

import java.util.List;
import java.util.Map;

import com.skilldistillery.trailmixer.entities.Address;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

public interface UserDAO {
	  User getUserByUserName(String userName);
	  User findUserById(int userId);
	  User updateUser(User user);
	  boolean deleteUser(int userId);
	  User addUser(User user);
	  Profile addProfile(Profile profile, Address address);
	  boolean duplicateUsername(String username);
	  Map<String, User> getUsers();
	  

}
