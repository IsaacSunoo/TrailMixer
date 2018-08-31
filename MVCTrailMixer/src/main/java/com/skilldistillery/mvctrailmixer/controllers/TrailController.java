package com.skilldistillery.mvctrailmixer.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mvctrailmixer.data.TrailsDAO;
import com.skilldistillery.trailmixer.entities.Trail;

@Controller 
public class TrailController {
	private TrailsDAO dao; 

	@RequestMapping(path="ListOfTrails.do", method = RequestMethod.GET)
	public List<Trail> getTrailList() {
		List<Trail> trails = dao.getListOfTrails(); 
		return trails;
	}
	
	@RequestMapping(path="ListOfTrailsDifficulty.do", method = RequestMethod.GET)
	public List<Trail> searchTrailDifficulty(int difficulty) {
		List<Trail> trails = dao.searchByDifficulty(difficulty); 
		return trails;
	}
	
	@RequestMapping(path="ListOfTrailsDistance.do", method = RequestMethod.GET)
	public List<Trail> searchTrailDistance(double distance) {
		List<Trail> trails = dao.searchByDistance(distance); 
		return trails;
	}
	
	@RequestMapping(path="ListOfTrailsAltitude.do", method = RequestMethod.GET)
	public List<Trail> searchTrailAltitude(int altitude) {
		List<Trail> trails = dao.searchByAltitude(altitude); 
		return trails;
	}
	
	@RequestMapping(path="ListOfTrailsRating.do", method = RequestMethod.GET)
	public List<Trail> searchTrailRating(int rating) {
		List<Trail> trails = dao.searchByRating(rating); 
		return trails;
	}
	
	@RequestMapping(path="ListOfTrailsKeyword.do", method = RequestMethod.GET)
	public List<Trail> searchTrailKeyword(String keyword) {
		List<Trail> trails = dao.searchByKeyword(keyword); 
		return trails;
	}
	
}
