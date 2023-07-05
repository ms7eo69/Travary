package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@GetMapping("/")
	public String contextRoot() {
		System.out.println("진입1");
		return "forward:/travary/Index.msp";
	}
	
	@GetMapping("/travary/Index.msp")
	public String index() {
		System.out.println("진입2");
		return "Index";
	}
}
