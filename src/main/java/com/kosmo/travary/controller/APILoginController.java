package com.kosmo.travary.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travary.service.impl.apilogin.GoogleLoginService;
import com.kosmo.travary.service.impl.apilogin.KakaoLoginService;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;
import com.kosmo.travary.service.impl.apilogin.NaverLoginService;

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
	

	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		String access_Token = kakaoLoginService.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
		
		Map<String, Object> apiLoginMap = new HashMap<>();
		
		String nickname = (String) userInfo.get("nickname");
		String image = (String) userInfo.get("image");
		//String email = (String) userInfo.get("email");
		String age = (String) userInfo.get("age");
		String gender = (String) userInfo.get("gender");
		//String birthday = (String) userInfo.get("birthday");
		String id = (String) userInfo.get("id");
		apiLoginMap.put("id", id);
		if(memberService.selectApiLoginOne(apiLoginMap)) {
			return "member/MyPage";
		}
		else {
			if (age.equals("10~19")) {age = "10대";}
			else if(age.equals("20~29")) {age = "20대";}
			else if(age.equals("30~39")) {age = "30대";}
			else if(age.equals("40~49")) {age = "40대";}
			else if(age.equals("50~59")) {age = "50대";}
			else if(age.equals("60~69")) {age = "60대";}
			else age = "70대 이상";
			/////////////////////////////
			if (gender.toLowerCase().equals("male")) {
				gender = "남자";
			}
			else 
				gender = "여자";
			
			apiLoginMap.put("nickname", nickname);
			apiLoginMap.put("profile_link", image);
			//apiLoginMap.put("email", email);
			apiLoginMap.put("age_group", age);
			apiLoginMap.put("gender", gender);
			//apiLoginMap.put("birthday", birthday);
			apiLoginMap.put("id", id);

			int affected = memberService.insert(apiLoginMap);
			
			return "member/Register";
		}
	}
	
	@GetMapping("/NaverMyPage.do")
	public String NaverLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		String access_Token = naverLoginService.getAccessToken(code);

		HashMap<String, Object> userInfo = naverLoginService.getUserInfo(access_Token);
		Map<String, Object> apiLoginMap = new HashMap<>();
		
		String nickname = (String) userInfo.get("nickname");
		String image = (String) userInfo.get("image");
		//String email = (String) userInfo.get("email");
		String age = (String) userInfo.get("age");
		String gender = (String) userInfo.get("gender");
		//String birthday = (String) userInfo.get("birthday");
		String id = (String) userInfo.get("id");
		apiLoginMap.put("id", id);
		if(memberService.selectApiLoginOne(apiLoginMap)) {
			return "member/MyPage";
		}
		else {
			if (age.equals("10-19")) {age = "10대";}
			else if(age.equals("20-29")) {age = "20대";}
			else if(age.equals("30-39")) {age = "30대";}
			else if(age.equals("40-49")) {age = "40대";}
			else if(age.equals("50-59")) {age = "50대";}
			else if(age.equals("60-69")) {age = "60대";}
			else age = "70대 이상";
			//////////////////////////////
			if (gender.toUpperCase().equals("M")) {
				gender = "남자";
			}
			else 
				gender = "여자";
			
			apiLoginMap.put("nickname", nickname);
			apiLoginMap.put("profile_link", image);
			//apiLoginMap.put("email", email);
			apiLoginMap.put("age_group", age);
			apiLoginMap.put("gender", gender);
			//apiLoginMap.put("birthday", birthday);
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
		String image = (String) userInfo.get("image");
		//String email = (String) userInfo.get("email");
		String id = (String) userInfo.get("id");
		String name = (String) userInfo.get("name");
		apiLoginMap.put("id", id);
		if(memberService.selectApiLoginOne(apiLoginMap)) {
			return "member/MyPage";
		}
		else {
			//String nickname = (String) userInfo.get("nickname");
						
			apiLoginMap.put("profile_link", image);
			apiLoginMap.put("nickname", name);
			apiLoginMap.put("id", id);
			
			int affected = memberService.GoogleInsert(apiLoginMap);
			
			return "member/Register";
		}
	}
}
