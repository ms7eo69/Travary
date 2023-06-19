package com.kosmo.travary.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import lombok.RequiredArgsConstructor;

@Controller
@SessionAttributes({"id"})
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
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		// 1번
		System.out.println("code:" + code);
		
		// 2번
		String access_Token = memberService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
	    
	    ModelAndView modelAndView = new ModelAndView("member/MyPage"); // 뷰 이름 설정
	    
	    return modelAndView;
	}
	
	@Controller
	@RequiredArgsConstructor
	public class LoginController {

	    @GetMapping("/naver-login")
	    public void naverLogin(HttpServletRequest request, HttpServletResponse response) throws MalformedURLException, UnsupportedEncodingException, URISyntaxException {
	        String url = memberService.getNaverAuthorizeUrl("authorize");
	        try {
	            response.sendRedirect(url);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
}
