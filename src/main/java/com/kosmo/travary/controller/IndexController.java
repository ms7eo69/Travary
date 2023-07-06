package com.kosmo.travary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travary.service.impl.plan.PlanServiceImpl;

@Controller
public class IndexController {

	
	@Autowired
	private PlanServiceImpl tour;
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
	public String plan(@RequestParam String sregion) {
		System.out.println(sregion);
		return "plan/Route";
	}
	
	@GetMapping("/Community.do")
	public String communitu() {return "community/List";}
}
