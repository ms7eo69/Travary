package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RouteController {
	
	@GetMapping("/Route.do")
	public String route() {
		return "/plan/Route";
	}
}
