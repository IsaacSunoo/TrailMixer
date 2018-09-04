package com.skilldistillery.mvctrailmixer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.trailmixer.entities.User;

@Controller
public class ProfileController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping("profile.do")
	public String account(HttpSession session) {
		
		User userInSession = (User) session.getAttribute(LoginController.USER_IN_SESSION_KEY);
		
		if(userInSession == null) {
			return "redirect:index.do";
		}
		
		return "trails/profile"; 
	}
	
	@RequestMapping(path="DeleteProfile.do", method=RequestMethod.POST)
	public String deleteProfile(Model model, int id, HttpSession session) {
		if (dao.deleteUser(id)) {
			session.removeAttribute(LoginController.USER_IN_SESSION_KEY);
			
			return "redirect:index.do";
		}
		else {
			model.addAttribute("profile", dao.findUserById(id));
			return "trails/profile";
		}
	}

}
