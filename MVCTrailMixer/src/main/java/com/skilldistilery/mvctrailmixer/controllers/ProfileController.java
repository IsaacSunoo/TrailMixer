package com.skilldistilery.mvctrailmixer.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.trailmixer.entities.User;

@Controller
public class ProfileController {
	
	@RequestMapping("profile.do")
	public String account(HttpSession session) {
		
		User userInSession = (User) session.getAttribute(LoginController.USER_IN_SESSION_KEY);
		
		if(userInSession == null) {
			return "redirect:login.do";
		}
		
		return "profile"; 
	}

}
