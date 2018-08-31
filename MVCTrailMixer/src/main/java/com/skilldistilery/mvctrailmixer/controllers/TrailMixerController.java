package com.skilldistilery.mvctrailmixer.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mvctrailmixer.data.TrailMixerDAO;

@Controller
public class TrailMixerController {
	
	@Autowired 
	private TrailMixerDAO dao;
	
	@RequestMapping (path="index.do", method = RequestMethod.GET)
	public String index (Model model) {
		return "index";
	}
	
	

}
