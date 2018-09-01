package com.skilldistillery.mvctrailmixer.data;

import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.trailmixer.entities.User;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
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
}
