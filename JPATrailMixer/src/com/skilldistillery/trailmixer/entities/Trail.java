package com.skilldistillery.trailmixer.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Trail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;

	private String name;
	private String description;
	private int altitude;
	
	@Column(name = "img_url")
	private String image;

	@OneToOne
	@JoinColumn(name = "difficulty_id")
	private Difficulty difficulty;

	private double distance;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;
	
	@ManyToMany(mappedBy="trails")
	private List<Profile> profiles;
//	end of fields

	public Trail() {
	}

	public Trail(String name, String description, int altitude, String image, Difficulty difficulty, double distance,
			Address address) {
		this.name = name;
		this.description = description;
		this.altitude = altitude;
		this.image = image;
		this.difficulty = difficulty;
		this.distance = distance;
		this.address = address;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAltitude() {
		return altitude;
	}

	public void setAltitude(int altitude) {
		this.altitude = altitude;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Difficulty getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(Difficulty difficulty) {
		this.difficulty = difficulty;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}
	
	public void addProfile(Profile profile) {
		if (profiles == null) {
			profiles = new ArrayList<>();
		}
		if (!profiles.contains(profile)) {
			profiles.add(profile);
			profile.addTrail(this);
		}
	}
	
	public void removeProfile(Profile profile) {
		if (profiles != null && profiles.contains(profile)) {
			profiles.remove(profile);
			profile.removeTrail(this);
		}
	}

	@Override
	public String toString() {
		return "Trail [Id=" + Id + ", name=" + name + ", description=" + description + ", altitude=" + altitude
				+ ", image=" + image + ", difficulty=" + difficulty + ", distance=" + distance + ", address=" + address
				+ "]";
	}

}
