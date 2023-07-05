<<<<<<<< HEAD:src/main/java/com/kosmo/travary/service/impl/api/NaverLoginService.java
package com.kosmo.travary.service.impl.api;
========
package com.kosmo.travary.service.impl.apilogin;
>>>>>>>> feature/api:src/main/java/com/kosmo/travary/service/impl/apilogin/NaverLoginService.java
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
@Service
public class NaverLoginService implements INaverLoginService {
	@Override
	public String getAccessToken(String authorize_code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://nid.naver.com/oauth2.0/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write("grant_type=authorization_code");
			os.write("&client_id=GsYVpg82aBYC9e00ww1B");
			os.write("&client_secret=MD3o8KGeb3");
			os.write("&redirect_uri=http://localhost:7070/member/NaverMyPage.do");
			os.write("&code=" + authorize_code);
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
		String reqURL = "https://openapi.naver.com/v1/nid/me";
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
			
			System.out.println(jsonMap.get("response"));
			
			Map<String, Object> response = (Map<String, Object>) jsonMap.get("response");
			String id = response.get("id").toString();
			String nickname = response.get("nickname").toString();
			String email = response.get("email").toString();
			String age = response.get("age").toString();
			String gender = response.get("gender").toString();
			String birthday = response.get("birthday").toString();
			String image = response.get("profile_image").toString();
			userInfo.put("id", id);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("age", age);
			userInfo.put("gender", gender);
			userInfo.put("birthday", birthday);
			userInfo.put("image", image);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
}