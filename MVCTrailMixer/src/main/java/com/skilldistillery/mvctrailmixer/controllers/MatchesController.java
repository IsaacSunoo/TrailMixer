package com.skilldistillery.mvctrailmixer.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.TrailsDAO;
import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.Trail;

@Controller
public class MatchesController {
	
	@Autowired
	private TrailsDAO tdao;
	
	@Autowired
	private UserDAO udao;
	
	public static final String USER_IN_SESSION_KEY = "UserInSession";

	@RequestMapping(path="TrailMatches.do", method=RequestMethod.GET)
	public String getMatches(@RequestParam(value="profileId", defaultValue= "0") int profileId) {
		if (profileId == 0) {
			return "trails/login";
		}
		
		Profile profile = udao.findProfileById(profileId);
		ModelAndView mv = new ModelAndView();
		List<Trail> trails = tdao.getListOfTrails();
		
		if (profile.getPreferences().get(0) != null) {
			for (Trail trail : trails) {
				if (trail.getAddress().getCity()
						.equalsIgnoreCase(profile.getPreferences().get(0).getArea().getCity())) {
					if (trail.getDifficulty().getId() <= profile.getPreferences().get(0).getDifficulty().getId()) {
						if (trail.getAltitude() <= profile.getPreferences().get(0).getAltitude()) {
							if (trail.getDistance() <= profile.getPreferences().get(0).getDistance()) {
								mv.addObject("trails", trail);
							}
						}
					}
				}
			} 
			return "hikes/matches";
		}
		else {
			mv.addObject("trails", trails); 
			return "trails/ListOfTrails";
		}
	}
	
}
