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

import com.kosmo.travary.service.impl.member.MemberServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")
@Slf4j
public class MemberController {

	
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
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		// 1번
		System.out.println("code:" + code);
		
		// 2번
		String access_Token = memberService.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		System.out.println((userInfo.get("nickname")));
		System.out.println(userInfo.get("email"));
		System.out.println((userInfo.get("age")));
		System.out.println(userInfo.get("gender"));
		System.out.println(userInfo.get("birthday"));
		System.out.println("###id#### : " + userInfo.get("id"));
	    
	    ModelAndView modelAndView = new ModelAndView("member/MyPage"); // 뷰 이름 설정
	    
	    return modelAndView;
	}

	//네이버 로그인
	@GetMapping("Login.do")
	public ModelAndView login() {
	    ModelAndView modelAndView = new ModelAndView("member/Login");
	    modelAndView.addObject("naverClientId", "GsYVpg82aBYC9e00ww1B");
	    return modelAndView;
	}
	// 네이버 로그인
	@RequestMapping(value = "MyPage.do", method = RequestMethod.GET)
	public String loginPOSTNaver(HttpServletRequest request, Model model) {
	    //log.info("callback controller");
	    String email = request.getParameter("email");
	    String nickname = request.getParameter("nickname");
	    String ageRange = request.getParameter("ageRange");
	    String uniqueId = request.getParameter("uniqueId");
	    String gender = request.getParameter("gender");
	    String birthday = request.getParameter("birthday");
	    
	    if(email != null) {
	    	System.out.println(email);
		    System.out.println(nickname);
		    System.out.println(ageRange);
		    System.out.println(uniqueId);
		    System.out.println(gender);
		    System.out.println(birthday);
		    model.addAttribute("email", email);
		    model.addAttribute("nickname", nickname);
		    model.addAttribute("ageRange", ageRange);
		    model.addAttribute("uniqueId", uniqueId);
		    model.addAttribute("ageRange", gender);
		    model.addAttribute("uniqueId", birthday);
		    //null이 아니라면 map.put으로 요소 저장하고 그 map을 insert 혹은 select 시키자
	    }
	    return "member/MyPage";
	}

	
	
}
