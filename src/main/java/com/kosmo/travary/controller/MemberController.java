package com.kosmo.travary.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travary.service.CookieInfo;
import com.kosmo.travary.service.Cookies;
import com.kosmo.travary.service.JWTokens;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;

@Controller
@RequestMapping("/kosmo/member")
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	private String tokenName;
	private String keyName;
	private String idName;

	
	public MemberController(CookieInfo cookieInfo) {
		tokenName = cookieInfo.getTokenName();
		keyName = cookieInfo.getKeyName();
		idName = cookieInfo.getIdName();
	}

	@RequestMapping("/Login.do")
	public String login() {
		return "member/Login";
	}
	
	@PostMapping("/LoginProcess.do")
	public String loginProcess(@RequestParam Map map, Model model, HttpServletRequest req, HttpServletResponse resp) {
		boolean isMember= memberService.isMember(map);
		if(isMember) {
			//토큰 방식으로 인증처리 구현
			map.put("keyName", keyName);
			//만료시간을 30분으로 하고, 자동생성된 비밀키를 secretKey로 하는 토큰 생성
			int expireMinute = 30;
			String token = JWTokens.createToken(keyName, map, expireMinute);
			System.out.println(token);
			System.out.println(map);
			//자동생성된 secretKey를 로그인한 유저의 key값으로 저장
			memberService.insertKey(map);
			Cookies.createCookie(tokenName, token, resp, req, expireMinute);
			Cookies.createCookie(idName, map.get("id").toString(), resp, req, expireMinute);
			req.setAttribute("validate"," ");
			return "member/MyPage";
		}
		else {
			model.addAttribute("NotMember", "아이디와 비번 불일치");
		}
		return "member/Login";
	}
	
	@GetMapping("Register.do")
	public String register() {
		return "member/Register";
	}
	
	@PostMapping("Register.do")
	public String registerProcess(
									@RequestParam String id, @RequestParam String pwd, @RequestParam String nickname, 
									@RequestParam String gender, @RequestParam String age_group, @RequestParam String phone) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("nickname", nickname);
		map.put("gender", gender);
		map.put("age_group", age_group);
		map.put("phone", phone);
		int affected = memberService.insert(map);
		return affected==1?"forward:/kosmo/member/Login.do":"member/Register";
	}
	
	@ExceptionHandler({Exception.class})
	public String error(Model model, Exception e) {
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "Index";
	}
	
	@GetMapping("Logout.do")
	public String logout(HttpServletRequest request,
											HttpServletResponse response) {
		Cookies.removeCookie(idName, request,  response);
		Cookies.removeCookie(tokenName, request, response);
		if(request.getAttribute("validate")!=null) {
			request.removeAttribute("validate");
		}
		return "Index";
	}
}
