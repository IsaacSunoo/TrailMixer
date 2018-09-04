package com.skilldistillery.mvctrailmixer.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HikeController {

	@RequestMapping(path="HikeHomepage.do", method = RequestMethod.GET)
	public ModelAndView showHomepage() {
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("hikes/HikeHomepage");
		return mv;
	}
	
	@RequestMapping(path="FindHike.do", method = RequestMethod.GET)
	public ModelAndView showHikes() {
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("hikes/FindAHike");
		return mv;
	}
	
	@RequestMapping(path="CreateHike.do", method = RequestMethod.GET)
	public ModelAndView createHike() {
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("hikes/CreateAHike");
		return mv;
	}
	
	@RequestMapping(path="ViewHikes.do", method = RequestMethod.GET)
	public ModelAndView viewHikes() {
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("hikes/YourHikes");
		return mv;
	}
	
	@RequestMapping(path="matches.do", method = RequestMethod.GET)
	public ModelAndView displayMatches() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("hikes/matches");
		return mv;
	}
	
	
	
}
