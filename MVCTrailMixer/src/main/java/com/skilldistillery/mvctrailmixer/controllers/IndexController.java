package com.skilldistillery.mvctrailmixer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.Address;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

@Controller
public class IndexController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path="index.do", method = RequestMethod.GET)
	public String homePage(Model model) {
		return "index";
	}
	
	@RequestMapping(path="addUser.do", method = RequestMethod.POST)
	public String addNewUser(User user, Profile profile, Address address, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		profile.setAddress(address);
		Profile newProfile = dao.addProfile(profile);
		User newUser = dao.addUser(user);
		session.setAttribute(LoginController.USER_IN_SESSION_KEY, newUser);
		mv.addObject("profile", newProfile);
		
		return "redirect:profile.do";
	}
	
	
	
}
