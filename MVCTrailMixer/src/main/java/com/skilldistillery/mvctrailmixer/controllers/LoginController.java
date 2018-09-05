package com.skilldistillery.mvctrailmixer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.Profile;
import com.skilldistillery.trailmixer.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO dao;
	
	public static final String USER_IN_SESSION_KEY = "UserInSession";

	@RequestMapping(path="login.do", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {

		User userInSession = (User) session.getAttribute(USER_IN_SESSION_KEY);
		
		// If a user is logged in and requests login.do they will be redirected to their profile page
		if(userInSession != null) {
			
			return "trails/profile";
		}
		model.addAttribute("user", new User());
		return "trails/login";
	}
	
	@RequestMapping(path="login.do", method = RequestMethod.POST)
	public ModelAndView loginUser(User inputUser, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User daoUser = dao.getUserByUserName(inputUser.getUsername());
		if(daoUser == null) {
			// show them the login page
			mv.setViewName("trails/login"); 
			errors.rejectValue("username", "error.username", "Invalid credentials");
		}
		else if (daoUser.getActiveUser() == 0){
//			if the user is set to inactive, don't take them to the login page.
//			instead, we need to ask them to set the account back to active
			mv.setViewName("trails/login");
			errors.rejectValue("username", "error.username", "Invalid credentials");
		}
		else {
			// load the User object into session, and redirect to the account page, account.do
			session.setAttribute(USER_IN_SESSION_KEY, daoUser);
			Profile profile = dao.findProfileById(daoUser.getId());
			mv.addObject("profile", profile);
			mv.setViewName("trails/profile");
		}
		return mv;
	}
	
	@RequestMapping(path="logout.do")
	public String logout(HttpSession session) {
		
		// remove user from session
		session.removeAttribute(USER_IN_SESSION_KEY);
		
		return "redirect:login.do";
	}
	
	@RequestMapping(path="SignUp.do", method = RequestMethod.GET)
	public ModelAndView createAccount(HttpSession session) {
	ModelAndView mv = new ModelAndView();
	mv.addObject("user", new User());
	mv.setViewName("trails/SignUp");
	return mv;
	
	}
}
//@RequestMapping(path="profile.do", method = RequestMethod.GET)
//public ModelAndView getUserInfo(int id) {
//	ModelAndView mv = new ModelAndView();
//	User user = dao.getUserInformation(id);
//	mv.addObject("user", user);
//	return mv;
//}
