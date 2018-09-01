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
	
	@RequestMapping(path="ListOfTrailsDifficulty.do", method = RequestMethod.GET)
	public ModelAndView searchTrailDifficulty(int difficulty) {
		ModelAndView mv = new ModelAndView(); 
		List<Trail> trails = dao.searchByDifficulty(difficulty); 
		mv.addObject("trails", trails); 
		mv.setViewName("trails/ListOfTrails");
		return mv;
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
