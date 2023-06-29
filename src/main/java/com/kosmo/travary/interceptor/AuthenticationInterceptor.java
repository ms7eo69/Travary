package com.kosmo.travary.interceptor;

import java.util.HashMap;
import java.util.Map;


import org.springframework.web.servlet.HandlerInterceptor;

import com.kosmo.travary.model.CookieInfo;
import com.kosmo.travary.model.Cookies;
import com.kosmo.travary.model.JWTokens;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationInterceptor implements HandlerInterceptor{

	
	private MemberServiceImpl memberService;
	private String idName;
	private String tokenName;
	
	public AuthenticationInterceptor(CookieInfo cookieInfo,MemberServiceImpl memberService) {
		this.tokenName = cookieInfo.getTokenName();
		this.idName =cookieInfo.getIdName();
		this.memberService = memberService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = Cookies.getCookieValue(idName, request);
		if(!("".equals(id)||id==null)) {
			System.out.println("id존재");
			String token = Cookies.getCookieValue(tokenName, request);
			Map map = new HashMap<>();
			map.put("id", id);
			map = memberService.selectOne(map);
			if(!JWTokens.verifyToken(token,map.get("KEY").toString())) {
				//토큰이 유효하지 않을때
				request.removeAttribute("validate");
				request.getRequestDispatcher("/member/Login.do").forward(request, response);
				return false;
			}
			request.setAttribute("validate",id);
		}
		return true;
	}
}
