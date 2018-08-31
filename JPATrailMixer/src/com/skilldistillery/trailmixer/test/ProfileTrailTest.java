package com.skilldistillery.trailmixer.test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.ProfileTrail;
import com.skilldistillery.trailmixer.entities.Trail;

class ProfileTrailTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private Trail tr; 
	private ProfileTrail pt; 
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
	public void test_profiletrail_to_profile_on_rating() {
		assertEquals(4, pt.getRating()); 
	}

}
