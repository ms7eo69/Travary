package com.kosmo.travary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.travary.service.impl.member.MemberServiceImpl;

@Controller
@SessionAttributes({"id"})
@RequestMapping("member")
public class MemberController {

	@GetMapping("Login.do")
	public String login() {
		
		return "member/Login";
	}
	
	@Autowired
	MemberServiceImpl memberService;
	@PostMapping("LoginProcess.do")
	public String process(@RequestParam Map map,Model model) {
		
		//서비스 호출
		boolean isMember= memberService.isLogin(map);
		//데이터 저장
		if(isMember) {
			model.addAttribute("id",map.get("id"));
		}
		else {
			model.addAttribute("NotMember","아이디와 비번 불일치");
		}
		//뷰정보 반환
		return "_09onememo/member/Login";
	}
	
	//로그아웃 처리
	@GetMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		//뷰정보 반환
		return "_09onememo/member/Login";
	}
}
