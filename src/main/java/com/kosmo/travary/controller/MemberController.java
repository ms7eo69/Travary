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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.travary.service.impl.member.KakaoLoginService;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")
@Slf4j
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;

	
	// 로그인 처리
	@GetMapping("Login.do")
	public String login(SessionStatus status) {
		status.setComplete();
		// 뷰정보 반환
		return "member/Login";
	}
		
	@PostMapping("LoginProcess.do")
	public String process(@RequestParam Map<String, Object> map, Model model) {
		// 데이터 저장
		/*if (isMember) {
			model.addAttribute("id", map.get("id"));
		} else {
			model.addAttribute("NotMember", "아이디와 비번 불일치");
		}*/
		// 뷰정보 반환
		return "member/Login";
	}

	// 로그아웃 처리
	@GetMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		// 뷰정보 반환
		return "member/Login";
	}
	

}
