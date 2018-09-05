package com.skilldistillery.mvctrailmixer.controllers;

import java.util.ArrayList;
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
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

@Controller
public class ProfileController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping("profile.do")
	public ModelAndView account(Profile profile, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User userInSession = (User) session.getAttribute(LoginController.USER_IN_SESSION_KEY);
		
		if(userInSession == null) {
			mv.setViewName("redirect:index.do");
			return mv;
		}
		
		mv.addObject("profile", profile);
		mv.setViewName("trails/profile");
		return mv; 
	}
	
	@RequestMapping(path="DeleteProfile.do", method=RequestMethod.POST)
	public String deleteProfile(@RequestParam int id, Model model, HttpSession session) {
		if (dao.deleteUser(id)) {
			session.removeAttribute(LoginController.USER_IN_SESSION_KEY);
			
			return "redirect:index.do";
		}
		else {
			model.addAttribute("profile", dao.findProfileById(id));
			return "trails/profile";
		}
	}
	
	@RequestMapping(path="EditProfile.do", method = RequestMethod.GET)
	public ModelAndView editProfile(@RequestParam int id) {
		ModelAndView mv = new ModelAndView();
		Profile prof = dao.findProfileById(id); 
		mv.addObject("profile", prof);
		mv.addObject("preferenceList", prof.getPreferences()); 
		mv.setViewName("trails/editProfile");
		return mv;
	}
	
	@RequestMapping(path="EditProfile.do", method = RequestMethod.POST)
	public ModelAndView editProfile(Profile prof) {
		ModelAndView mv = new ModelAndView();
		Profile updatedProfile = dao.updateProfile(prof); 
		// update preferences by profile 
		
		mv.addObject("profile", updatedProfile);
		mv.setViewName("trails/profile");
		return mv;
	}
	
//	@RequestMapping(path="profile.do", method = RequestMethod.GET)
//	public ModelAndView getUserInfo(int id) {
//		ModelAndView mv = new ModelAndView();
//		User user = dao.getUserInformation(id);
//		mv.addObject("user", user);
//		return mv;
//	}
	
}