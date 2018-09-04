package com.skilldistillery.mvctrailmixer.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MatchesController {
	
	public static final String USER_IN_SESSION_KEY = "UserInSession";

	@RequestMapping(path="", method=RequestMethod.GET)
	public String getMatches() {
		
		return "hikes/matches";
	}

}
