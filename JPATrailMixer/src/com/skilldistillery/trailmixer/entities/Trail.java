package com.skilldistillery.trailmixer.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Trail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	private String name;
	
	private String description;
	
	private int altitude;
	
	private String image;
	
	private Difficulty difficulty;
	
	private double distance;
	
	private Address address;

}
