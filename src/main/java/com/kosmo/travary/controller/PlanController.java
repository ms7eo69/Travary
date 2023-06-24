package com.kosmo.travary.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kosmo.travary.service.PlanService;
import com.kosmo.travary.service.impl.touristspot.TourServiceImpl;

@Controller
@RequestMapping("/plan")
public class PlanController {
	
	@Autowired
	PlanService service;
	@Autowired
	TourServiceImpl tour;

	@GetMapping("Get.do")
	public String get() {
		
		return "plan/PlanTemplate";
	}
	@GetMapping("Search.do")
	public String search() {
		
		return "plan/Search";
	}
	@GetMapping("Geo.do")
	public String geo() {
		
		return "plan/AddrToGeo";
	}
	
	@PostMapping("/GetSearchTrend.do")
	@ResponseBody
	public Map searchTrend() {			
		return service.searchTrend();
	}
	@PostMapping("/GetgeoLocation.do")
	@ResponseBody
	public Map geolocation(@RequestParam String addr) {			
		return service. geolocation(addr);
	}
	
	@GetMapping("/GetRoute.do")
	@ResponseBody
	public Map getRoute(@RequestParam Map map) {		
          map = service.direction();
		return map;
	}
	
	@GetMapping("/Direction.do")
	public String direction() {
		return "plan/Direction";
	}
}
