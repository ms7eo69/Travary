package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping("/")
	public String contextRoot() {
		return "Index";
	}
	
	@GetMapping("/kosmo/Index.do")
	public String index() {
		return "Index";
	}
}
