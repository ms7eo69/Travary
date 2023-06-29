package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String contextRoot() {
		return "forward:/kosmo/Index";
	}
	
	@GetMapping("/kosmo/Index")
	public String index() {
		return "Index";
	}
}
