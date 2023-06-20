package com.kosmo.travary.controller;

import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/plan")
public class PlanController {

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
	public String geoLocation(@RequestParam Map<String, String> map,Model model) {		
        try {
            // RestTemplate 객체 생성
        	System.out.println(map.get("url"));
            RestTemplate restTemplate = new RestTemplate();
            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
            headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
            headers.setContentType(MediaType.APPLICATION_JSON);
            
            JSONObject requestBody = new JSONObject();
            requestBody.put("startDate", "2022-01-01");
            requestBody.put("endDate", "2023-06-10");
            requestBody.put("timeUnit", "month");
            
            JSONArray keywordGroups = new JSONArray();
            //첫번째 키워드그룹 생성
            JSONObject group1 = new JSONObject();
            group1.put("groupName", "여행");
            JSONArray keywords = new JSONArray();
            keywords.put("남애항 스카이워크 전망대");
            group1.put("keywords",keywords);
            keywordGroups.put(group1);
            //모든 추가된 키워드그룹들 요청바디에 추가 
            requestBody.put("keywordGroups", keywordGroups);
            HttpEntity<String> requestEntity = new HttpEntity<>(requestBody.toString(), headers);
            // API 호출 및 데이터 가져오기
            ResponseEntity<Map> response = restTemplate.exchange("https://naveropenapi.apigw.ntruss.com/datalab/v1/search", HttpMethod.POST, requestEntity, Map.class);
            if (response.getStatusCode() == HttpStatus.OK) {
                Map data = response.getBody();    
                System.out.println(data);
                // 데이터를 모델에 저장
                model.addAttribute("data", data);
            } else {
                // API 호출이 실패한 경우
                String errorMessage = "API 호출이 실패하였습니다. 응답 코드: " + response.getStatusCodeValue();
                
                // 에러 메시지를 모델에 저장
                model.addAttribute("error", errorMessage);
            }
        } catch (RestClientException e) {
            e.printStackTrace();         
            // 예외 발생 시 에러 메시지를 모델에 저장
            model.addAttribute("error", "API 호출 중 예외가 발생하였습니다.");
        }  
        // 데이터를 담은 모델을 이용해 view로 반환
		return "plan/AddrToGeo";
	}
}
