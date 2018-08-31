package com.skilldistilery.mvctrailmixer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.User;

public class LoginController {
	
	@Autowired
	private UserDAO dao;
	
	public static final String USER_IN_SESSION_KEY = "UserInSession";

	@RequestMapping(path="login.do", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		//  If a user is logged in and requests login.do, they should be redirected to index.do
		User userInSession = (User) session.getAttribute(USER_IN_SESSION_KEY);
		
		if(userInSession != null) {
			return "redirect:index.do";
		}
		
		model.addAttribute("user", new User());
		return "WEB-INF/login.jsp";
	}
	
	
	@RequestMapping(path="login.do", method = RequestMethod.POST)
	public ModelAndView loginUser(User inputUser, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User daoUser = dao.getUserByUserNameAndPassword(inputUser.getUsername(), inputUser.getPassword());
		if(daoUser == null) {
			// show them the login page
			mv.setViewName("WEB-INF/login.jsp");
			errors.rejectValue("userName", "error.userName", "Invalid credentials");
		}
		else {
			// load the User object into session, and redirect to the account page, account.do
			session.setAttribute(USER_IN_SESSION_KEY, daoUser);
			mv.setViewName("redirect:account.do");
		}
		
		return mv;
	}
	
	@RequestMapping(path="logout.do")
	public String logout(HttpSession session) {
		
		// remove user from session
		session.removeAttribute(USER_IN_SESSION_KEY);
		
		return "redirect:index.do";
	}

}
