package com.skilldistillery.mvctrailmixer.controllers;

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
	
	@RequestMapping(path="EditProfile.do", method = RequestMethod.GET)
	public ModelAndView editProfile(@RequestParam(name="id") int id) {
		ModelAndView mv = new ModelAndView();
		Profile prof = dao.findProfileById(id); 
		mv.addObject(prof); 
		mv.setViewName("trails/editProfile");
		return mv;
	}
	
	
	
//	@RequestMapping(path="EditProfile.do", method = RequestMethod.POST)
//	public ModelAndView editProfile(Profile prof) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("editProf1", prof); 
//		mv.addObject("editProf2", prof); 
//		mv.addObject("editProf3", prof); 
//		mv.addObject("editProf4", prof); 
//		mv.addObject("editProf5", prof); 
//		mv.addObject("editProf6", prof); 
//		return mv;
//	}
	
//	 mv.addObject("cmdObjectOne", new CommandObjectOne());
//	 mv.addObject("cmdObjectTwo", new CommandObjectTwo());

}
