package com.kosmo.travary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kosmo.travary.service.impl.plan.PlanServiceImpl;
import com.kosmo.travary.service.route.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {
	
	@Autowired
	PlanService service;
	@Autowired
	PlanServiceImpl tour;

	@GetMapping("Get.do")
	public String get() {
		
		return "plan/PlanTemplate";
	}
	@GetMapping("Search.do")
	public String search() {
		
		return "plan/SearchTrend";
	}
	@GetMapping("Geo.do")
	public String geo() {
		
		return "plan/AddrToGeo";
	}
	
//	@PostMapping("/GetSearchTrend.do")
//	@ResponseBody
//	public Map searchTrend() {			
//		return service.searchTrend();
//	}
//	
//	@PostMapping("/GetgeoLocation.do")
//	@ResponseBody
//	public Map geolocation(@RequestParam String addr) {			
//		return service. geolocation(addr);
//	}
	
	@GetMapping("/getRoute.do")
	@ResponseBody
	public Map getRoute(@RequestParam Map map) {		
          map = service.direction(map);
		return map;
	}
	
	@GetMapping("MultipleMarker.do")
	public String multipleMarker(Model model) {
		return "plan/MultipleMarker";
	}
	
	@PostMapping("/SearchTrend.do")
	public @ResponseBody Map searchTrend(
			@RequestBody Map body,
			@RequestHeader MultiValueMap<String, String> header) {
		System.out.println(123);
		String url = "https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
		RestTemplate template = new RestTemplate();
		Map map = template.exchange(url, HttpMethod.POST, new HttpEntity(body, header),Map.class).getBody();
		System.out.println(map);
		return map;
	}
}
