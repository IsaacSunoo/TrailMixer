package com.skilldistillery.mvctrailmixer.data;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
	public static final String userQuery = "Select u from User u";
	
	private Map<Integer, User> users;

	@PersistenceContext
	private EntityManager em;

	@Override
	public User getUserByUserNameAndPassword(String userName, String password) {
		User u = null;
		Set<Integer> keys = users.keySet();
		for (Integer key : keys) {
			User user = users.get(key);
			if (user.getUsername().equals(userName) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
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
