package com.skilldistillery.mvctrailmixer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.TrailsDAO;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.Trail;

public class MatchesController {
	
	@Autowired
	private TrailsDAO tdao;
	
	public static final String USER_IN_SESSION_KEY = "UserInSession";

	@RequestMapping(path="", method=RequestMethod.GET)
	public String getMatchesByDistance(Profile profile) {
		ModelAndView mv = new ModelAndView();
		List<Trail> trails = tdao.getListOfTrails();
		
		for (Trail trail : trails) {
			if (trail.getDistance() >= profile.getPreferences().)
		}
		
		return "hikes/matches";
	}

}
