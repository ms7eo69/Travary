package com.kosmo.travary.service;

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
import com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.sym;

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
			try {
				String queryString = getCoords(map);
				String start = "?start="+queryString.split("!")[1];
				String waypoints = "&waypoints="+queryString.split("!")[0];
				String goal = "&goal="+queryString.split("!")[1];
				url = url+start+goal+waypoints;
				map.put("result",new RestTemplate().exchange(url, HttpMethod.GET,new HttpEntity<>(setNaverHeaders()),Map.class).getBody());
			}
			catch(Exception e) {
				
			}
		return map; 
	}

	private String getCoords(Map map) {
		
		//메인 관광지 조회
		Map main = tour.selectMainPlace(map.get("lregion").toString());
		System.out.println(main);
//		int countee = tour.selectCountByBoundary(main);
//		System.out.println(countee);
//		int temp23 = Integer.parseInt("가나다");
		main.put("COUNT",5);
		List<Map> waypoints = tour.selectByBoundary(main);
		System.out.println(waypoints);
		waypoints.add(main);
		map.put("wayPoints",waypoints);
		System.out.println("처음 리스트"+waypoints);
		String queryString= "";
		int count =1;
		int minindex=0;
		for(int i =0 ; i<waypoints.size();i++) {
			//다른 관광지사이의 거리 구하기
			double min=100;
			Double lnti = Double.parseDouble(waypoints.get(i).get("LNT").toString());
			Double lati = Double.parseDouble(waypoints.get(i).get("LAT").toString());
			if(i < waypoints.size()-2) {
				for(int k=i+1 ; k < waypoints.size();k++) {
					Double lntk = Double.parseDouble(waypoints.get(k).get("LNT").toString());
					Double latk = Double.parseDouble(waypoints.get(k).get("LAT").toString());
					double distance = Math.sqrt(Math.pow( lntk - lnti, 2) + Math.pow(latk - lati, 2));
					System.out.println(String.format("%s와 %s사이의 거리:%f", 
							waypoints.get(i).get("NAME"),waypoints.get(k).get("NAME"),distance));
					if(min > distance) {
						min = distance;
						minindex=k;
					}
				}
				System.out.println(String.format("거리가 최소인 지역이름:%s 그 인덱스:%d",waypoints.get(minindex).get("NAME"),minindex));
				Map temp = waypoints.get(i+1);
				waypoints.set(i+1, waypoints.get(minindex));
				waypoints.set(minindex,temp);
				System.out.println("바꾼후 리스트"+waypoints);
			}
			//i번째 관광지 쿼리스트링 누적
			String coord = lnti+","+lati;
			if(i<waypoints.size()-1) {
				coord +="|";
			queryString +=coord;
			}
		}
		Map acmd = tour.selectACMDByBoundary(main);
		map.put("start",acmd);
		map.put("goal",acmd);
		queryString += "!"+acmd.get("LNT")+","+acmd.get("LAT");
		return queryString;
	}	
	private HttpHeaders setNaverHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("X-NCP-APIGW-API-KEY-ID", naverApiKeyId);
		headers.add("X-NCP-APIGW-API-KEY", naverApiKey);
		return headers;
	}
}
