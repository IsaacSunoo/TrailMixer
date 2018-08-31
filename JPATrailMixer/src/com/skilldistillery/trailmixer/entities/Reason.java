package com.skilldistillery.trailmixer.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Reason {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String reason;

	public Reason() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		id = id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "Reason [Id=" + id + ", reason=" + reason + "]";
	}

}
