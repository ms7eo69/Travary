package com.kosmo.travary.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kosmo.travary.service.impl.touristspot.TourServiceImpl;

@Service
public class PlanService {

	@Autowired
	TourServiceImpl tour;
<<<<<<< Updated upstream
	@Value("${naver-api-key-id}")
	private String naverKeyId;
	@Value("${naver-api-key}")
	private String naverKey;
	

=======
	@Value("${NAVER-API-KEY-ID}")
	private String naverApiKeyId;
	@Value("${NAVER-API-KEY}")
	private String naverApiKey;
	
>>>>>>> Stashed changes
	public Map searchTrend() {

		// 고정설정
		String url = "https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
<<<<<<< Updated upstream
		headers.add("X-NCP-APIGW-API-KEY-ID", naverKeyId);
		headers.add("X-NCP-APIGW-API-KEY", naverKey);
=======
		headers.add("X-NCP-APIGW-API-KEY-ID", naverApiKeyId);
		headers.add("X-NCP-APIGW-API-KEY", naverApiKey);
>>>>>>> Stashed changes
		headers.setContentType(MediaType.APPLICATION_JSON);
		JSONObject requestBody = new JSONObject();
		requestBody.put("startDate", "2022-01-01");
		requestBody.put("endDate", "2022-12-31");
		requestBody.put("timeUnit", "month");
		Map sqlmap = new HashMap<>();
		int lastNum = tour.select();
		Map dataMap = null;
		// 가변설정 (반복시 초기화)
		try {
			for (int m = 0; m < 994; m++) {
				JSONArray keywordGroups = new JSONArray();
				JSONObject group = null;
				JSONArray keyword = null;
				sqlmap = new HashMap<>();
				sqlmap.put("no", lastNum);
				List<String> names = tour.selectfour(sqlmap);
				names.add("에버랜드");
				for (String name : names) {
					group = new JSONObject();
					keyword = new JSONArray();
					group.put("groupName", name);
					keyword.put(name);
					group.put("keywords", keyword);
					keywordGroups.put(group);
				}
				// 모든 추가된 키워드그룹들 요청바디에 추가
				requestBody.put("keywordGroups", keywordGroups);
				// 요청 바디와 헤더를 포함한 HttpEntity 객체 생성
				System.out.println(requestBody);
				ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, new HttpEntity(requestBody.toString(), headers), Map.class);
				dataMap = response.getBody();
				System.out.println(dataMap);
				for (int i = 0; i < 4; i++) {
					sqlmap = new HashMap<>();
					ArrayList list = (ArrayList) ((LinkedHashMap) ((ArrayList) dataMap.get("results")).get(i)).get("data");
					for (int k = 0; k < list.size(); k++) {
						LinkedHashMap data = (LinkedHashMap) list.get(k);
						String month = null;
						switch (data.get("period").toString()){
						case "2022-01-01": month="JAN"; break;
						case "2022-02-01": month="FEB"; break;
						case "2022-03-01": month="MAR"; break;
						case "2022-04-01": month="APR"; break;
						case "2022-05-01": month="MAY"; break;
						case "2022-06-01": month="JUN"; break;
						case "2022-07-01": month="JUL"; break;
						case "2022-08-01": month="AUG"; break;
						case "2022-09-01": month="SEP"; break;
						case "2022-10-01": month="OCT"; break;
						case "2022-11-01": month="NOV"; break;
						default: month="DEC";
					}
					sqlmap.put(month, data.get("ratio"));
					}
					sqlmap.put("no",lastNum++);
					tour.insert(sqlmap);
				}
			}
		}
		finally {
			sqlmap.put("no",lastNum);
			tour.updateLastNum(sqlmap);
		}
		return dataMap;
	}

	public Map direction() {
		Map data = null;
		try {
			// URL 설정
			String start = "128.9052901222,35.0967044145";
			String goal = "128.9066569316,35.0870333005";
			// String waypoints =getWaypoints(null);
			String url = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=" + start + "&goal="
					+ goal;
			// + "//+"&waypoints="+waypoints;
			// RestTemplate 객체 생성
			RestTemplate restTemplate = new RestTemplate();
			// 요청 헤더 설정
			HttpHeaders headers = new HttpHeaders();
			headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
			headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
			// API 호출 및 데이터 가져오기
			ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(headers),
					Map.class);
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
		return "35.3027559437,129.1854434167:" + "35.2002043557,129.2289258030:" + "35.1920578383,129.2177964393:"
				+ "35.2898226616,129.1101753296:" + "35.2891615670,129.1070700628";
	}

	private String putWaypoints(int count) {

		List<String> waypoints = null;
//		for (int i = 0; i < count ; i++) {
//			//카운트만큼 관광지 읽어와서 관광지 위도와 경도를 waypoints에 add
//			waypoints.add(null);
//		}
		return null;
	}

	public Map geolocation(String addr) {
		String url = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("X-NCP-APIGW-API-KEY-ID", "ohzsg7u4i3");
		headers.add("X-NCP-APIGW-API-KEY", "KS4Y6EwbXgwCr4EOIZKp5gDcxLihq2lAphJucVbX");
		ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<>(headers), Map.class);
		return response.getBody();	
	}
}
