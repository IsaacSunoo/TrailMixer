package com.skilldistillery.mvctrailmixer.data;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.trailmixer.entities.Trail;

public class TrailsDAOImpl implements TrailsDAO{
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("TrailMixer");
	private EntityManager em = emf.createEntityManager();

	@Override
	public List<Trail> getListOfTrails() {
		String query = "SELECT t FROM Trail t"; 
		List<Trail> trails = em.createQuery(query, Trail.class).getResultList(); 
		return trails;
	}
	
	@Override
	public Trail getTrailDetails(int id) {
		String query = "SELECT t FROM Trail t WHERE t.id = :id"; 
		Trail tr = em.createQuery(query, Trail.class).setParameter("id", id).getSingleResult(); 
		return tr; 
	}

	// "search by" methods
	@Override
	public List<Trail> searchByDifficulty(int difficulty) {
		String query = "SELECT t FROM Trail t WHERE t.difficulty.id = :difficulty";
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
		String query = "SELECT t FROM Trail t WHERE t.distance <= :finalDistance ORDER BY t.distance DESC";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("finalDistance", finalDistance).getResultList();
		return trails;
	}

	@Override
	public List<Trail> searchByMaxAltitude(int altitude) {
		String query = "SELECT t FROM Trail t WHERE t.altitude <= :altitude ORDER BY t.altitude DESC";
		List<Trail> trails = em.createQuery(query, Trail.class).setParameter("altitude", altitude).getResultList();
		return trails;
	}

//	return a list of trails where the rating is equal to greater than their rating
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
	
	// "sort by" methods 
	
	@Override
	public List<Trail> sortByDifficulty() {
		String query = "SELECT t FROM Trail t ORDER BY t.difficulty DESC";
		List<Trail> trails = em.createQuery(query, Trail.class).getResultList();
		return trails;
	}

	@Override
	public List<Trail> sortByDistance() {
		String query = "SELECT t FROM Trail t ORDER BY t.distance DESC";
		List<Trail> trails = em.createQuery(query, Trail.class).getResultList();
		return trails;
	}
	
	@Override
	public List<Trail> sortByAltitude() {
		String query = "SELECT t FROM Trail t ORDER BY t.altitude DESC";
		List<Trail> trails = em.createQuery(query, Trail.class).getResultList();
		return trails;
	}
	
	// need to write query for order by rating 
	@Override
	public List<Trail> sortByRating() {
		String query = "";
		List<Trail> trails = em.createQuery(query, Trail.class).getResultList();
		return trails;
	}

}
