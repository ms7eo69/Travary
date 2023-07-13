package com.kosmo.travary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.kosmo.travary.service.impl.plan.PlanServiceImpl;

@Controller
public class ImageController {

	@Autowired
	private PlanServiceImpl plan;
	@RequestMapping("/image")
	public String image() {
		List<Map> records = plan.selectList(null);
		RestTemplate rest = new RestTemplate();
		
		return null;
	}
}
