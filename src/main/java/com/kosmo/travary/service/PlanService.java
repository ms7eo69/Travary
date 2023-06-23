package com.kosmo.travary.service;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class PlanService {

	public Map searchTrend(Map map){
		
		Map data = null;
		try {	
        	//URL 설정
        	String url = "https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
        	// RestTemplate 객체 생성
            RestTemplate restTemplate = new RestTemplate();
            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
            headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
            headers.setContentType(MediaType.APPLICATION_JSON);
            //요청 바디 설정
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
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, requestEntity, Map.class);
            if (response.getStatusCode() == HttpStatus.OK) {
                data = response.getBody();    
            } else {
                // API 호출이 실패한 경우 에러 메시지를 모델에 저장
                String errorMessage = "API 호출이 실패하였습니다. 응답 코드: " + response.getStatusCodeValue();      
            }
        } catch (RestClientException e) {
            e.printStackTrace();         
            // 예외 발생 시 에러 메시지를 모델에 저장
        }
		return data;
	}
	
	public Map direction(){	
		Map data = null;
		try {	
        	//URL 설정
			String start ="128.9052901222,35.0967044145";
			String goal = "128.9066569316,35.0870333005";
			//String waypoints =getWaypoints(null);
        	String url = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start="+start+"&goal="+goal;
        			//+ "//+"&waypoints="+waypoints;
        	// RestTemplate 객체 생성
            RestTemplate restTemplate = new RestTemplate();
            // 요청 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
            headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");    
            // API 호출 및 데이터 가져오기
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), Map.class);
            if (response.getStatusCode() == HttpStatus.OK) {
                data = response.getBody();    
            } else {
                // API 호출이 실패한 경우 에러 메시지를 모델에 저장
                String errorMessage = "API 호출이 실패하였습니다. 응답 코드: " + response.getStatusCodeValue();      
                System.out.println(errorMessage);
            }
        } catch (RestClientException e) {
            e.printStackTrace();         
            // 예외 발생 시 에러 메시지를 모델에 저장
        }
		return data;
	}
	
	private String getWaypoints(List<String> waypoints) {
		String result = "";
//		for (String waypoint : waypoints) {
//			result += waypoint;
//		}
		return "35.3027559437,129.1854434167:"
				+ "35.2002043557,129.2289258030:"
				+ "35.1920578383,129.2177964393:"
				+ "35.2898226616,129.1101753296:"
				+ "35.2891615670,129.1070700628";
	}
	
	private String putWaypoints(int count) {
		
		List<String> waypoints = null;
//		for (int i = 0; i < count ; i++) {
//			//카운트만큼 관광지 읽어와서 관광지 위도와 경도를 waypoints에 add
//			waypoints.add(null);
//		}
		return null;
	}
}
