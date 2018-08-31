package com.skilldistillery.trailmixer.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Profile;

class ProfileTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private Profile prof; 

	@BeforeEach
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("TrailMixer");
		em = emf.createEntityManager();
		prof = em.find(Profile.class, 1); 
	}

	@AfterEach()
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_one_profile_to_one_user() {
		
	}
	
	@Test
	public void test_one_profile_to_many_preferences() {
		
	}
	
	@Test
	public void test_one_profile_to_one_address() {
		
	}
	
	@Test
	public void test_one_profile_to_many_trails() {
		
	}
	
	@Test
	public void test_one_profile_to_many_reasons() {
		
	}
	

}
