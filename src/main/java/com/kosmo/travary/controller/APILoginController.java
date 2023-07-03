package com.kosmo.travary.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.travary.model.CookieInfo;
import com.kosmo.travary.model.Cookies;
import com.kosmo.travary.model.JWTokens;
import com.kosmo.travary.service.impl.member.GoogleLoginService;
import com.kosmo.travary.service.impl.member.IKakaoLoginService;
import com.kosmo.travary.service.impl.member.KakaoLoginService;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;
import com.kosmo.travary.service.impl.member.NaverLoginService;

@Controller
@RequestMapping("member")
public class APILoginController {

	@Autowired
	private KakaoLoginService kakaoLoginService;
	@Autowired
	private NaverLoginService naverLoginService;
	@Autowired
	private GoogleLoginService googleLoginService;
	@Autowired
	private MemberServiceImpl memberService;
	
	private String idName;
	private String tokenName;
	private String keyName;
	
	public APILoginController(CookieInfo cookieInfo) {
		tokenName = cookieInfo.getTokenName();
		keyName = cookieInfo.getKeyName();
		idName = cookieInfo.getIdName();
	}
	
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpServletRequest req,
	        HttpServletResponse resp) throws Throwable {
		
		String access_Token = kakaoLoginService.getAccessToken(code);

		HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
		String id = (String) userInfo.get("id");
		Map<String, Object> apiLoginMap = new HashMap<>();
		
			String nickname = (String) userInfo.get("nickname");
			String image = (String) userInfo.get("image");
			String pwd = (String) userInfo.get("email");
			String age = (String) userInfo.get("age");
			String gender = (String) userInfo.get("gender");
			String birthday = (String) userInfo.get("birthday");
			
			System.out.println(nickname);
			System.out.println(image);
			System.out.println(pwd);
			System.out.println(age);
			System.out.println(gender);
			System.out.println(birthday);
			
			if (age.equals("10~19")) {
				age = "10대";
			}
			else if(age.equals("20~29")) {
				age = "20대";
			}
			else if(age.equals("30~39")) {
				age = "30대";
			}
			else if(age.equals("40~49")) {
				age = "40대";
			}
			else if(age.equals("50~59")) {
				age = "50대";
			}
			else if(age.equals("60~69")) {
				age = "60대";
			}
			else 
				age = "70대 이상";
			/////////////////////////////
			if (gender.toLowerCase().equals("male")) {
				gender = "남자";
			}
			else 
				gender = "여자";
			
			apiLoginMap.put("nickname", nickname);
			apiLoginMap.put("profile_link", image);
			apiLoginMap.put("pwd", pwd);
			apiLoginMap.put("age_group", age);
			apiLoginMap.put("gender", gender);
			apiLoginMap.put("birthday", birthday);
			apiLoginMap.put("id", id);
			apiLoginMap.put("keyName", keyName);
			
			int affected = memberService.GoogleInsert(apiLoginMap);
			int expireMinute = 30;
			String token = JWTokens.createToken(id, apiLoginMap, expireMinute);
			//자동생성된 secretKey를 로그인한 유저의 key값으로 저장
			Cookies.createCookie(tokenName, token, resp, req, expireMinute);
			//Cookies.createCookie(idName, apiLoginMap.get("identifier").toString(), resp, req, expireMinute);
			System.out.println(apiLoginMap.get("id"));
			req.setAttribute("validate", apiLoginMap.get("id"));
			
			System.out.println(token);

			return affected ==1?"forward:/":"member/MyPage";
		
	}
	
	@GetMapping("/NaverMyPage.do")
	public String NaverLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		String access_Token = naverLoginService.getAccessToken(code);

		HashMap<String, Object> userInfo = naverLoginService.getUserInfo(access_Token);
		Map<String, Object> apiLoginMap = new HashMap<>();
		
		String nickname = (String) userInfo.get("nickname");
		String image = (String) userInfo.get("image");
		String email = (String) userInfo.get("email");
		String age = (String) userInfo.get("age");
		String gender = (String) userInfo.get("gender");
		String birthday = (String) userInfo.get("birthday");
		String id = (String) userInfo.get("id");
		apiLoginMap.put("id", id);
		if(memberService.selectApiLoginOne(apiLoginMap)) {
			return "member/MyPage";
		}
		else {
			if (age.equals("10-19")) {
				age = "10대";
			}
			else if(age.equals("20-29")) {
				age = "20대";
			}
			else if(age.equals("30-39")) {
				age = "30대";
			}
			else if(age.equals("40-49")) {
				age = "40대";
			}
			else if(age.equals("50-59")) {
				age = "50대";
			}
			else if(age.equals("60-69")) {
				age = "60대";
			}
			else 
				age = "70대 이상";
			//////////////////////////////
			if (gender.toUpperCase().equals("M")) {
				gender = "남자";
			}
			else 
				gender = "여자";
			
			System.out.println(nickname);
			System.out.println(image);
			System.out.println(email);
			System.out.println(age);
			System.out.println(gender);
			System.out.println(birthday);
			System.out.println(id);
			
			apiLoginMap.put("nickname", nickname);
			apiLoginMap.put("profile_link", image);
			//kakaoMap.put("email", email);
			apiLoginMap.put("age_group", age);
			apiLoginMap.put("gender", gender);
			//kakaoMap.put("birthday", birthday);
			apiLoginMap.put("id", id);

			int affected = memberService.insert(apiLoginMap);

			return "member/Register";
		}
	}
	
	@GetMapping("/GoogleMyPage.do")
	public String GoogleLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		String access_Token = googleLoginService.getAccessToken(code);

		HashMap<String, Object> userInfo = googleLoginService.getUserInfo(access_Token);
		Map<String, Object> apiLoginMap = new HashMap<>();
		
			//String nickname = (String) userInfo.get("nickname");
			String image = (String) userInfo.get("image");
			String email = (String) userInfo.get("email");
			String id = (String) userInfo.get("id");
			String name = (String) userInfo.get("name");
			
			apiLoginMap.put("profile_link", image);
			apiLoginMap.put("nickname", name);
			apiLoginMap.put("id", id);
			
			int affected = memberService.GoogleInsert(apiLoginMap);
			
			return "member/MyPage";
		
	}
}
