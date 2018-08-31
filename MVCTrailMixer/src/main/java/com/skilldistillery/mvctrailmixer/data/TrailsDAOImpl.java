package com.skilldistillery.mvctrailmixer.data;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.trailmixer.entities.Trail;

public class TrailsDAOImpl implements TrailsDAO{
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("VideoStore");
	private EntityManager em = emf.createEntityManager();

	@Override
	public List<Trail> getListOfTrails() {
		String query = "SELECT t FROM Trail t"; 
		List<Trail> trails = em.createQuery(query, Trail.class).getResultList(); 
		return trails;
	}

	@Override
	public List<Trail> searchByDifficulty(int difficulty) {
		String query = "SELECT t FROM Trail t WHERE t.difficulty = :difficulty";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("difficulty", difficulty).getResultList();
		return trails;
	}

	@Override
	public List<Trail> searchByDistance(double distance) {
		double finalDistance = 0.0; 
		DecimalFormat df = new DecimalFormat("0.00");
		String format = df.format(distance); 
		try {
			finalDistance = (Double)df.parse(format) ;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String query = "SELECT t FROM Trail t WHERE t.distance = :finalDistance";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("finalDistance", finalDistance).getResultList();
		return trails;
	}

	@Override
	public List<Trail> searchByAltitude(int altitude) {
		String query = "SELECT t FROM Trail t WHERE t.altitude = :altitude";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("altitude", altitude).getResultList();
		return trails;
	}

	@Override
	public List<Trail> searchByRating(int rating) {
		String query = "SELECT pt FROM ProfileTrail pt WHERE pt.rating = :rating";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("rating", rating).getResultList();
		return trails;
	}

	@Override
	public List<Trail> searchByKeyword(String keyword) {
		String query = "SELECT t FROM Trail t WHERE t.name CONTAINS :keyword";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("keyword", keyword).getResultList();
		return trails;
	}

}
