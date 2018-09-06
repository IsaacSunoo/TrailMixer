package com.skilldistillery.mvctrailmixer.data;

import java.util.List;
import java.util.Map;

import com.skilldistillery.trailmixer.entities.Area;
import com.skilldistillery.trailmixer.entities.Difficulty;
import com.skilldistillery.trailmixer.entities.Preference;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

public interface UserDAO {
	  User getUserByUserName(String userName);
	  User findUserById(int userId);
	  User updateUser(User user);
	  boolean deleteUser(int userId);
	  Profile addProfile(Profile profile);
	  boolean duplicateUsername(String username);
	  Map<String, User> getUsers();
	  public Profile findProfileById(int profileId);
	  public Profile updateProfile(int id, String firstName, String lastName, int age, String image, String gender, String bio);
	  public Preference updatePreference(Preference pref); 
	  public Preference updatePreference(int id, String difficulty, String area, double distance, int altitude);
	  public Difficulty findDifficulty(String name); 
	  public Area findArea(String city); 
	  public List<Preference> getPreferencesByProfileId(int profileId); 
	  public User getUserInformation(int id);
	  public Profile getProfileById(int id);
	  User addUser(User user, String firstName, String lastName, int age); 
}
