package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping("/")
	public String contextRoot() {
		return "forward:/kosmo/Index.msp";
	}
	
	@GetMapping("/kosmo/Index.msp")
	public String index() {
		return "Index";
	}
}
