package com.skilldistillery.trailmixer.test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.trailmixer.entities.Address;
import com.skilldistillery.trailmixer.entities.Profile;

class AddressTest {
	private EntityManagerFactory emf; 
	private EntityManager em; 
	private Address add; 

	@BeforeEach
	public void setUp() {
		emf = Persistence.createEntityManagerFactory("TrailMixer");
		em = emf.createEntityManager();
		add = em.find(Address.class, 1); 
	}

	@AfterEach()
	public void tearDown() {
		em.close();
		emf.close();
	}

	@Test
	public void test_address_with_street_number() {
		assertEquals("123 Main St", add.getStreet()); 
	}
	
	@Test
	public void test_one_address_to_one_trail() {
		
	}
	

}
