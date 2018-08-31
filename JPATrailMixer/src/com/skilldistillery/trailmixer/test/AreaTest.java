package com.skilldistillery.trailmixer.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Area;

class AreaTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private Area area; 

	@BeforeEach
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("TrailMixer");
		em = emf.createEntityManager();
		area = em.find(Area.class, 1); 
	}

	@AfterEach()
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_one_area_to_many_preferences() {
		
	}

}
