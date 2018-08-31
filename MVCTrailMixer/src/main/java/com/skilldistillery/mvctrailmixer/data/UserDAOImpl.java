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
	public User updateUser(int userId, User user) {
		
		return null;
	}
}
