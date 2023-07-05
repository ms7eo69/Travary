package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@GetMapping("/travary")
	public String index() {
		return "Index";
	}
	@GetMapping("/community.do")
	public String community() {
		return "community/List";
	}
}
