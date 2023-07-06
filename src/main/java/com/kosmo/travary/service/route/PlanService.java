package com.kosmo.travary.service.route;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kosmo.travary.service.impl.plan.PlanServiceImpl;

@Service
public class PlanService {

	@Autowired
	PlanServiceImpl tour;

	@Value("${NAVER-API-KEY-ID}")
	private String naverApiKeyId;
	@Value("${NAVER-API-KEY}")
	private String naverApiKey;

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
		List<Map> wayPoints = tour.selectByBoundary(map);
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
		
		//시작 출발지 설정 (숙소 혹은 집)
//		Map acmd =  tour.selectAcmd(map.get("region").toString());
//		queryString += "!"+acmd.get("LNT")+","+acmd.get("LAT");
//		map.put("start",acmd);
//		//도착지 설정
//		queryString += "!"+acmd.get("LNT")+","+acmd.get("LAT");
//		map.put("goal",acmd);
		System.out.println(map.get("wayPoints"));
		return queryString;
	}	
	private HttpHeaders setNaverHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("X-NCP-APIGW-API-KEY-ID", naverApiKeyId);
		headers.add("X-NCP-APIGW-API-KEY", naverApiKey);
		return headers;
	}
}
