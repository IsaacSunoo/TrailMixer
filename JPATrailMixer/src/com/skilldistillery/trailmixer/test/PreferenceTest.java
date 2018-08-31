package com.skilldistillery.trailmixer.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Preference;

class PreferenceTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private Preference pref; 

	@BeforeEach
	public void setUp() {
		pref = null; 
		emf = Persistence.createEntityManagerFactory("TrailMixer");
		em = emf.createEntityManager();
	}

	@AfterEach()
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_many_preferences_to_one_difficulty() {
		
	}
	
	@Test
	public void test_many_preferences_to_one_profile() {
		
	}
	
	@Test
	public void test_many_preferences_to_one_area() {
		
	}

}
