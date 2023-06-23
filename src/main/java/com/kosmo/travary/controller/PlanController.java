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
		String url ="https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
		RestTemplate restTemplate = new RestTemplate();
		 HttpHeaders headers = new HttpHeaders();
         headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
         headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
         headers.setContentType(MediaType.APPLICATION_JSON);
         JSONObject requestBody = new JSONObject();
         requestBody.put("startDate", "2022-01-01");
         requestBody.put("endDate", "2022-12-31");
         requestBody.put("timeUnit", "month");
         JSONArray keywordGroups = new JSONArray();
         JSONObject group = null;
         JSONArray keyword = null;
         Map sqlmap = new HashMap<>();
         int lastNum = tour.select();
 		sqlmap.put("no",lastNum);
 		List<String> names = tour.selectfour(sqlmap);
 		for(String name : names ) {
 			group = new JSONObject();
  			keyword = new JSONArray();
 			group.put("groupName", name);
 			keyword.put(name);
 	         group.put("keywords",keyword);
 	        keywordGroups.put(group);
 		}
         //모든 추가된 키워드그룹들 요청바디에 추가 
         requestBody.put("keywordGroups", keywordGroups);
         HttpEntity<String> requestEntity = new HttpEntity<>(requestBody.toString(), headers);
         ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, Map.class);
         sqlmap = response.getBody();
         System.out.println(sqlmap);
         Map map = new HashMap<>();
         for (int i = 0; i < 4; i++) {
 			for(int k=0;k<12;k++) {
 				map.put((k+1)+"m",Double.parseDouble(((LinkedHashMap)((ArrayList)((LinkedHashMap)((ArrayList)sqlmap.get("results")).get(i)).get("data")).get(k)).get("ratio").toString()));
 			}
 			System.out.println(lastNum);
 			map.put("no",lastNum);
 			System.out.println(map);
 			tour.insert(map);
 			lastNum++;
 		}
         tour.updateLastNum(sqlmap);
		return sqlmap;
//		
//		System.out.println((((ArrayList)map.get("results")).get(0)));
//		ArrayList results = ((ArrayList)map.get("results"));
//		LinkedHashMap place0 = (LinkedHashMap)results.get(0);
//		ArrayList months = (ArrayList)place0.get("data");
//		LinkedHashMap month = (LinkedHashMap)months.get(0);
//		System.out.println(month.get("ratio")+month.get("ratio").getClass().toString());
////		ArrayList data = ((ArrayList)result.get(2));
////		System.out.println(data);
//		
//		return map;
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
