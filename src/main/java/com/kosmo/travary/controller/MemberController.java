package com.kosmo.travary.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.travary.model.CookieInfo;
import com.kosmo.travary.service.Cookies;
import com.kosmo.travary.service.JWTokens;
import com.kosmo.travary.service.impl.member.KakaoLoginService;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")


public class MemberController {

	@Autowired
	MemberServiceImpl memberService;

	private String idName;
	private String tokenName;
	private String keyName;
	
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
			req.setAttribute("validate",id);
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
									@RequestParam Map map) {
		String phone = map.get("phone1") + "-" + map.get("phone2")+ "-" + map.get("phone3"); //회원가입할때 전화번호 입력시 DB에 ,로 입력되는거 수정용
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
