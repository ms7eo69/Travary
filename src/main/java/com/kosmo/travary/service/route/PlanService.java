package com.kosmo.travary.service.route;

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

	@Value("${NAVER-API-KEY-ID}")
	private String naverApiKeyId;
	@Value("${NAVER-API-KEY}")
	private String naverApiKey;
	
	public Map searchTrend() {

		// 고정설정
		String url = "https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("X-NCP-APIGW-API-KEY-ID", naverApiKeyId);
		headers.add("X-NCP-APIGW-API-KEY", naverApiKey);
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
			for (int m = 0; m < 1; m++) {
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
				for (int i = 0; i < 1; i++) {
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
					sqlmap.put("no",1);
					System.out.println(sqlmap);
					tour.insert(sqlmap);
					break;
				}
			}
		}
		finally {
			sqlmap.put("no",lastNum);
			tour.updateLastNum(sqlmap);
		}
		return dataMap;
	}

	public Map direction(String region) {
			// URL 설정
			String url = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving";
			Map map = getCoords(region);
			String start = "?start="+map.get("start");
			String waypoints = "&waypoints="+map.get("waypoints");
			String goal = "&goal="+map.get("start");
			url = url+start+goal+waypoints;
		return new RestTemplate().exchange(url, HttpMethod.GET,new HttpEntity<>(setNaverHeaders()),Map.class).getBody();
	}

	private Map getCoords(String region) {
		
		//모든 결과를 담을 맵 생성
		Map resultMap = new HashMap<>();
		
		//경유지 설정 (관광지)
		List<Map> wayPoints = tour.selectTop5ByRegion(region);
		String wayQuery= "";
		int count =1;
		for (Map wayPoint : wayPoints) {
			String coord = wayPoint.get("LNT").toString()+","+wayPoint.get("LAT").toString();
			if(count<wayPoints.size()) {
				coord +="|";
				wayQuery +=coord;
			}
			else {
				wayQuery +=coord;
			}
			count++;
		}
		System.out.println(wayQuery);
		resultMap.put("wayPoints",wayPoints);
		
		//시작 출발지 설정 (숙소 혹은 집)
		Map acmd =  tour.selectAcmd(region);
		String coord = acmd.get("LNT").toString()+","+acmd.get("LAT").toString();
		resultMap.put("start",coord);
		
		return resultMap;
	}
	public Map geolocation(String addr) {
		String url = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
		return new RestTemplate().exchange(url, HttpMethod.GET, new HttpEntity<>(setNaverHeaders()), Map.class).getBody();	
	}
	
	private HttpHeaders setNaverHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("X-NCP-APIGW-API-KEY-ID", naverApiKeyId);
		headers.add("X-NCP-APIGW-API-KEY", naverApiKey);
		return headers;
	}
}