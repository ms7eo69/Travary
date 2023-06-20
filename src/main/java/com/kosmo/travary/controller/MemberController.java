package com.kosmo.travary.controller;

import java.util.HashMap;
import java.util.Map;

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

import com.kosmo.travary.service.impl.member.MemberServiceImpl;

@Controller
@RequestMapping("member")
public class MemberController {

	@GetMapping("Login.do")
	public String login() {
		
		return "member/Login";
	}
	
	@GetMapping("MyPage.do")
	public String MyPage() {
		
		return "member/MyPage";
	}
	
	
	@Autowired
	MemberServiceImpl memberService;
	@PostMapping("LoginProcess.do")
	public String process(@RequestParam Map map,Model model) {
		
		//데이터 저장
		/*if(isMember) {
			model.addAttribute("id",map.get("id"));
		}*/
		/*
		 * else { model.addAttribute("NotMember","아이디와 비번 불일치"); }
		 */
		//뷰정보 반환
		return "member/Login";
	}
	
	//로그아웃 처리
	@GetMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		//뷰정보 반환
		return "member/Login";
	}
	
	//카카오 로그인
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		// 1번
		System.out.println("code:" + code);
		
		return null;	
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음

	}
}
