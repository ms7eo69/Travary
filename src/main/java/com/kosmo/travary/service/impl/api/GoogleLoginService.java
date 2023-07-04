package com.kosmo.travary.service.impl.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class GoogleLoginService implements IGoogleLoginService {
	
	@Override
	public String getAccessToken(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://oauth2.googleapis.com/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write("grant_type=authorization_code");
			os.write("&client_id=971116911703-f7afs5url9crbvhm5lsc0l0fpn3toens.apps.googleusercontent.com");
			os.write("&client_secret=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");
			os.write("&redirect_uri=http://localhost:7070/member/GoogleMyPage.do");
			os.write("&code=" + java.net.URLDecoder.decode(authorize_code, "UTF-8"));
			os.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
				access_Token = jsonMap.get("access_token").toString();
				refresh_Token = jsonMap.get("refresh_token").toString();
			
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			
			br.close();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://www.googleapis.com/oauth2/v2/userinfo";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			ObjectMapper objectMapper = new ObjectMapper();
			
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			
			String id = jsonMap.get("id").toString();
			String name = jsonMap.get("name").toString();
			String image = jsonMap.get("picture").toString();
			String email = jsonMap.get("email").toString();
			
			userInfo.put("id", id);
			userInfo.put("name", name);
			userInfo.put("image", image);
			userInfo.put("email", email);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
}

