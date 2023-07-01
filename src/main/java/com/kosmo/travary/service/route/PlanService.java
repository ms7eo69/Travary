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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
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
			for (int m = 0; m < 814; m++) {
				JSONArray keywordGroups = new JSONArray();
				JSONObject group = null;
				JSONArray keyword = null;
				sqlmap = new HashMap<>();
				sqlmap.put("no", lastNum);
				List<String> names = tour.selectfour(sqlmap);
				System.out.println(names);
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

	public Map direction(Map map) {
			// URL 설정
			String url = "https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving";
			String queryString = getCoords(map);
			String start = "?start="+queryString.split("!")[1];
			String waypoints = "&waypoints="+queryString.split("!")[0];
			String goal = "&goal="+queryString.split("!")[2];
			url = url+start+goal+waypoints;
			map.put("result",new RestTemplate().exchange(url, HttpMethod.GET,new HttpEntity<>(setNaverHeaders()),Map.class).getBody());
		return map; 
	}

	private String getCoords(Map map) {
		
		//경유지 설정 (관광지)
		List<Map> wayPoints = tour.selectTop5ByRegion(map.get("region").toString());
		map.put("wayPoints",wayPoints);
		System.out.println("처음 리스트"+wayPoints);
		String queryString= "";
		int count =1;
		int minindex=0;
		for(int i =0 ; i<wayPoints.size();i++) {
			//다른 관광지사이의 거리 구하기
			double min=100;
			Double lnti = Double.parseDouble(wayPoints.get(i).get("LNT").toString());
			Double lati = Double.parseDouble(wayPoints.get(i).get("LAT").toString());
			if(i < wayPoints.size()-2) {
				for(int k=i+1 ; k < wayPoints.size();k++) {
					Double lntk = Double.parseDouble(wayPoints.get(k).get("LNT").toString());
					Double latk = Double.parseDouble(wayPoints.get(k).get("LAT").toString());
					double distance = Math.sqrt(Math.pow( lntk - lnti, 2) + Math.pow(latk - lati, 2));
					System.out.println(String.format("%s와 %s사이의 거리:%f", 
							wayPoints.get(i).get("NAME"),wayPoints.get(k).get("NAME"),distance));
					if(min > distance) {
						min = distance;
						minindex=k;
					}
				}
				System.out.println(String.format("거리가 최소인 지역이름:%s 그 인덱스:%d",wayPoints.get(minindex).get("NAME"),minindex));
				Map temp = wayPoints.get(i+1);
				wayPoints.set(i+1, wayPoints.get(minindex));
				wayPoints.set(minindex,temp);
				System.out.println("바꾼후 리스트"+wayPoints);
			}
			//i번째 관광지 쿼리스트링 누적
			String coord = lnti+","+lati;
			if(i<wayPoints.size()-1) {
				coord +="|";
			}
			queryString +=coord;
		}
		
//		for (Map wayPoint : wayPoints) {
//			System.out.println(wayPoint.get("NAME"));
//			String coord = 
//					wayPoint.get("LNT")+","+wayPoint.get("LAT");
//			
//			if(count<wayPoints.size()) {
//				coord +="|";
//				queryString +=coord;
//			}
//			else 
//				queryString +=coord;
//			count++;
//		}	
		//시작 출발지 설정 (숙소 혹은 집)
		Map acmd =  tour.selectAcmd(map.get("region").toString());
		queryString += "!"+acmd.get("LNT")+","+acmd.get("LAT");
		map.put("start",acmd);
		//도착지 설정
		queryString += "!"+acmd.get("LNT")+","+acmd.get("LAT");
		map.put("goal",acmd);
		System.out.println(map.get("wayPoints"));
		return queryString;
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
