package com.skilldistillery.trailmixer.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Preference {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "difficulty_id")
	private Difficulty difficulty;

	@ManyToOne
	@JoinColumn(name = "area_id")
	private Area area;

	private int altitude;

	@ManyToOne
	@JoinColumn(name = "profile_id")
	private Profile profile;

	public Preference() {
	}

	public Preference(Difficulty difficulty, Area area, int altitude, Profile profile) {
		this.difficulty = difficulty;
		this.area = area;
		this.altitude = altitude;
		this.profile = profile;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		id = id;
	}

	public Difficulty getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(Difficulty difficulty) {
		this.difficulty = difficulty;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public int getAltitude() {
		return altitude;
	}

	public void setAltitude(int altitude) {
		this.altitude = altitude;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Preference [Id=" + id + ", difficulty=" + difficulty + ", area=" + area + ", altitude=" + altitude
				+ ", profile=" + profile + "]";
	}

}
