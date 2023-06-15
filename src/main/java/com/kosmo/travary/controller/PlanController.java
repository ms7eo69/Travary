package com.kosmo.travary.controller;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("plan")
public class PlanController {

	@GetMapping("Get.do")
	public String get() {
		
		return "plan/PlanTemplate";
	}
	@GetMapping("Geo.do")
	public String geo() {
		
		return "plan/AddrToGeo";
	}
	
	@PostMapping("GetgeoLocation.do")
	public String geoLocation(@RequestParam Map<String, String> map,Model model) {		
        try {
            // RestTemplate 객체 생성
        	System.out.println(map.get("url"));
            RestTemplate restTemplate = new RestTemplate(); 
            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
            headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
            // API 호출 및 데이터 가져오기
            ResponseEntity<Map> response = restTemplate.exchange(map.get("url"), HttpMethod.GET, new HttpEntity<>(headers), Map.class);
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
