package com.skilldistillery.mvctrailmixer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.TrailsDAO;
import com.skilldistillery.mvctrailmixer.data.TrailsDAOImpl;
import com.skilldistillery.trailmixer.entities.Trail;

@Controller 
public class TrailController {
	// @Autowired
	private TrailsDAO dao = new TrailsDAOImpl(); 
	
	// list of trails and details

	@RequestMapping(path="ListOfTrails.do", method = RequestMethod.GET)
	public ModelAndView getTrailList() {
		ModelAndView mv = new ModelAndView(); 
		List<Trail> trails = dao.getListOfTrails(); 
		mv.addObject("trails", trails); 
		mv.setViewName("trails/ListOfTrails");
		return mv;
	}
	
	@RequestMapping(path="TrailDetails.do", method = RequestMethod.GET)
	public ModelAndView getDetails(int id) {
		ModelAndView mv = new ModelAndView(); 
		Trail trail = dao.getTrailDetails(id);  
		mv.addObject("trail", trail); 
		mv.setViewName("trails/TrailDetails");
		return mv;
	}
	
	// sort by 
	
	@RequestMapping(path="ListOfTrailsSorted.do", method = RequestMethod.GET)
	public ModelAndView searchTrailSorted(String sortBy) {
		ModelAndView mv = new ModelAndView(); 
		List<Trail> trails = null; 
		switch (sortBy) {
		case "difficultyHard":
			trails = dao.sortByDifficultyHard(); 
			break;
		case "difficultyEasy":
			trails = dao.sortByDifficultyEasy(); 
			break;
		case "distanceFar":
			trails = dao.sortByDistanceFar(); 
			break; 
		case "distanceShort":
			trails = dao.sortByDistanceShort(); 
			break; 
		case "altitudeHigh": 
			trails = dao.sortByAltitudeHigh(); 
			break; 
		case "altitudeLow": 
			trails = dao.sortByAltitudeLow(); 
			break; 
		case "rating":
			trails = dao.sortByRating(); 
			break; 
		default:
			trails = dao.getListOfTrails(); 
			break;
		}
		mv.addObject("trails", trails); 
		mv.setViewName("trails/ListOfTrails");
		return mv;
	}
	
	// search by 
	
	@RequestMapping(path="ListOfTrailsSearched.do", method = RequestMethod.GET)
	public ModelAndView searchTrail(String searchBy, String search) {
		ModelAndView mv = new ModelAndView(); 
		double d = Double.MAX_VALUE;
		int i = Integer.MAX_VALUE; 
		try {
			d = Double.parseDouble(search); 
			i = Integer.parseInt(search); 
		}
		catch (NumberFormatException nfe) {
			
		}
		List<Trail> trails = null; 
		switch (searchBy) {
		case "difficulty": 
			trails = dao.searchByDifficulty(i); 
			break; 
		case "distance": 
			trails = dao.searchByDistance(d); 
			break; 
		case "altitude": 
			trails = dao.searchByMaxAltitude(i); 
			break; 
		case "rating": 
			trails = dao.searchByRating(i); 
			break; 
		default:
			trails = dao.getListOfTrails(); 
			break; 
		}
		mv.addObject("trails", trails); 
		mv.setViewName("trails/ListOfTrails");
		return mv;
	}
	
	@RequestMapping(path="KeywordSearch.do", method = RequestMethod.GET)
	public List<Trail> searchTrailKeyword(String keyword) {
		List<Trail> trails = dao.searchByKeyword(keyword); 
		return trails;
	}
}
