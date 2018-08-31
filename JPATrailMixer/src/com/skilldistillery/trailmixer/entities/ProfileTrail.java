package com.skilldistillery.trailmixer.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class ProfileTrail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "profile_id")
	private Profile profile;

	@ManyToOne
	@JoinColumn(name = "trail_id")
	private Trail trail;

	private int rating;
//	end of fields

	public ProfileTrail() {
	}

	public ProfileTrail(Profile profile, Trail trail, int rating) {
		this.profile = profile;
		this.trail = trail;
		this.rating = rating;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		id = id;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Trail getTrail() {
		return trail;
	}

	public void setTrail(Trail trail) {
		this.trail = trail;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "ProfileTrail [rating=" + rating + "]";
	}

}
