package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("plan")
public class PlanController {

	@GetMapping("Get.do")
	public String get() {
		
		return "plan/PlanTemplate";
	}
}
