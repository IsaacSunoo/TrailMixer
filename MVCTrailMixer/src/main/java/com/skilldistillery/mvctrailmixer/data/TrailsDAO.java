package com.skilldistillery.mvctrailmixer.data;

import java.util.List;

import com.skilldistillery.trailmixer.entities.Trail;

public interface TrailsDAO {
	public List<Trail> getListOfTrails(); 
	public Trail getTrailDetails(int id); 
	public List<Trail> searchByDifficulty(int difficulty); 
	public List<Trail> searchByDistance(double distance); 
	public List<Trail> searchByAltitude(int altitude); 
	public List<Trail> searchByRating(int rating); 
	public List<Trail> searchByKeyword(String keyword); 
	public List<Trail> sortByDifficulty(); 
	public List<Trail> sortByDistance(); 
}
