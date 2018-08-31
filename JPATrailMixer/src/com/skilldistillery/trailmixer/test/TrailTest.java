package com.skilldistillery.trailmixer.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Trail;

class TrailTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private Trail tr; 

	@BeforeEach
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("TrailMixer");
		em = emf.createEntityManager();
		tr = em.find(Trail.class, 1); 
	}

	@AfterEach()
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_one_trail_to_many_profiles() {
		
	}
	
	@Test
	public void test_many_trails_to_one_address() {
		
	}
	
	@Test
	public void test_many_trails_to_one_difficulty() {
		
	}
	

}
