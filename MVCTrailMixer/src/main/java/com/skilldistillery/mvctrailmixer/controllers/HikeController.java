package com.skilldistillery.mvctrailmixer.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.TrailsDAO;
import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.ProfileTrail;

@Controller
public class HikeController {
	
	private List<ProfileTrail> pfs = new ArrayList<>();
	
	@Autowired
	private UserDAO udao;
	
	@Autowired
	private TrailsDAO tdao;

	@RequestMapping(path="HikeHomepage.do", method = RequestMethod.GET)
	public ModelAndView showHomepage(HttpSession session) {
		
		ModelAndView mv = new ModelAndView(); 
		if (session.getAttribute("UserInSession") == null) {
			mv.setViewName("redirect:login.do");
			return mv;
		}
		
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
	
	@RequestMapping(path="addHike.do", method=RequestMethod.POST)
	public ModelAndView addHike(@RequestParam(value="profileId", defaultValue="0") int profileId, @RequestParam(value="trailId", defaultValue="0") int trailId) {
		ModelAndView mv = new ModelAndView();
		if (profileId == 0) {
			mv.setViewName("redirect:login.do");
			return mv;
		}
//		not finished
		
		
		return mv;
	}
	
}
