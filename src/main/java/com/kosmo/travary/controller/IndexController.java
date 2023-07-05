package com.kosmo.travary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.travary.service.impl.touristspot.TourServiceImpl;

@Controller
public class IndexController {

	
	@Autowired
	private TourServiceImpl tour;
	@RequestMapping("/")
	public String contextRoot() {
		return "forward:/travary/Index.msp";
	}
	
	@RequestMapping("/travary/Index.msp")
	public String index(Model model) {
		List<String> list = tour.selectSregion();
		model.addAttribute("sregionList", list);
		return "Index";
	}
	@GetMapping("/Plan.do")
	public String plan() {return "plan/Route";}
	
	@GetMapping("/Community.do")
	public String communitu() {return "community/List";}
}
