package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	
	@RequestMapping("/")
	public String contextRoot() {
		return "forward:/travary/Index.msp";
	}
	
	@RequestMapping("/travary/Index.msp")
	public String index() {
		return "Index";
	}
	@GetMapping("/Plan.do")
	public String plan() {return "plan/Route";}
	
	@GetMapping("/Community.do")
	public String communitu() {return "community/List";}
}
