package com.skilldistillery.trailmixer.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.ProfileTrail;

class ProfileTrailTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private ProfileTrail pt; 

	@BeforeEach
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("TrailMixer");
		em = emf.createEntityManager();
		pt = em.find(ProfileTrail.class, 1); 
	}

	@AfterEach()
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_profiletrail_to_profile_on_rating() {
		
	}
	
	@Test
	public void test_profiletrail_to_trail_on_rating() {
		
	}

}
