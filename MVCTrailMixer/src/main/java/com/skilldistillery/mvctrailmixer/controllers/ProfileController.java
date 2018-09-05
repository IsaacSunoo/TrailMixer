package com.skilldistillery.mvctrailmixer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.Preference;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

@Controller
public class ProfileController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping("profile.do")
	public ModelAndView account(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User userInSession = (User) session.getAttribute(LoginController.USER_IN_SESSION_KEY);
		
		if(userInSession == null) {
			mv.setViewName("redirect:login.do");
			return mv;
		}
		
		Profile profile = dao.findProfileById(userInSession.getId());
		mv.addObject("profile", profile);
		mv.setViewName("trails/profile");
		return mv; 
	}
	
	@RequestMapping(path="DeleteProfile.do", method=RequestMethod.POST)
	public String deleteProfile(@RequestParam int profileId, Model model, HttpSession session) {
		if (dao.deleteUser(profileId)) {
			session.removeAttribute(LoginController.USER_IN_SESSION_KEY);
			
			return "redirect:index.do";
		}
		else {
			model.addAttribute("profile", dao.findProfileById(profileId));
			return "trails/profile";
		}
	}
	
	@RequestMapping(path="EditProfile.do", method = RequestMethod.GET)
	public ModelAndView editProfile(@RequestParam int profileId) {
		ModelAndView mv = new ModelAndView();
		Profile prof = dao.findProfileById(profileId); 
		mv.addObject("profile", prof);
		List<Preference> preferences = dao.getPreferencesByProfileId(profileId);
		mv.addObject("preferences", preferences); 
		mv.setViewName("trails/editProfile");
		return mv;
	}
	
	@RequestMapping(path="EditProfile.do", method = RequestMethod.POST)
	public ModelAndView editProfile(Profile prof) {
		ModelAndView mv = new ModelAndView();
		Profile updatedProfile = dao.updateProfile(prof); 
		mv.addObject("profile", updatedProfile);
		mv.setViewName("trails/profile");
		return mv;
	}
	
	@RequestMapping(path="EditPreferences.do", method = RequestMethod.GET)
	public ModelAndView editPreferencesGet(@RequestParam int profileId) {
		ModelAndView mv = new ModelAndView();
		Profile prof = dao.findProfileById(profileId); 
		mv.addObject("profile", prof);
		List<Preference> preferences = dao.getPreferencesByProfileId(profileId);
		mv.addObject("preferences", preferences); 
		mv.setViewName("trails/editPreference");
		return mv;
	}
	
	@RequestMapping(path="EditPreferences.do", method = RequestMethod.POST)
	public ModelAndView editPreferences(@RequestParam int profileId) {
		ModelAndView mv = new ModelAndView();
		List<Preference> preferences = dao.getPreferencesByProfileId(profileId);
		mv.addObject("preferences", preferences); 
		mv.setViewName("trails/profile");
		return mv;
	}

	
}