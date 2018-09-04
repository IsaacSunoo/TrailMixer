package com.skilldistillery.mvctrailmixer.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.trailmixer.entities.Address;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
	public static final String userQuery = "Select u from User u";
	
	private Map<String, User> users;

	@PersistenceContext
	private EntityManager em;

	@Override
	public Map<String, User> getUsers() {
		String query = "Select u from User u";
		List<User> userList = em.createQuery(query).getResultList();
		users = new HashMap<>();
		for (User user : userList) {
			users.put(user.getUsername(), user);
		}
		return users;
	}
	
	@Override
	public User getUserByUserName(String userName) {
		String query = "Select u from User u where u.username = :name";
		User u = null;
		try {
			u = em.createQuery(query, User.class)
					.setParameter("name", userName)
					.getSingleResult();
		} catch (NoResultException e) {
			
		}
		
		return u;
	}

	@Override
	public User findUserById(int userId) {
		User u = users.get(userId);
		return u;
	}

	@Override
	public User updateUser(User user) {
		User updatedUser = em.find(User.class, user.getId());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setUsername(user.getUsername());
		updatedUser.setActiveUser(1);
		
		return updatedUser;
	}
	
/* instead of deleting the user, i am setting the "active status" to 0. when the 
 * user logs in, we will check to see if it is an active user before we direct 
 * them to the account page
*/
	@Override
	public boolean deleteUser(int userId) {
		User u = em.find(User.class, userId);
		
		u.setActiveUser(0);
		
		return (u.getActiveUser() == 0);
	}

	@Override
	public User addUser(User user) {
		em.persist(user);
		em.flush();
		
		return user;
		
	}

	@Override
	public Profile addProfile(Profile profile) {
		
		em.persist(profile);
		em.flush();
		
		return profile;
		
	}

	@Override
	public boolean duplicateUsername(String username) {
		boolean duplicate = true;
		List<User> allUsers = em.createQuery(userQuery, User.class).getResultList();
		for (User user : allUsers) {
			if (user.getUsername().equalsIgnoreCase(username)) {
				duplicate = false;
			}
		}
		return duplicate;
	}
}
