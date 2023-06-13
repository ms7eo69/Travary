package com.kosmo.travary.board.service.web;

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

import com.project.MoonSeongHyun2.board.service.impl.BoardServiceImpl;

@Controller
//스프링 시큐리티 적용시 로그인,로그아웃 주석하고 @Serivce 주입
@SessionAttributes({"id"})
@RequestMapping("onememo/auth")
public class AuthController {

	//서비스 주입
	@Autowired
	private BoardServiceImpl memoService;
	
	//로그인 폼으로 이동(스프링 시큐리티 대비해 @RequestMapping)
	@RequestMapping("Login.do")
	public String login() {
		return "_09onememo/member/Login";
	}
	
	@PostMapping("LoginProcess.do")
	public String process(@RequestParam Map map,Model model) {
		
		//서비스 호출
		boolean isMember= memoService.isLogin(map);
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
