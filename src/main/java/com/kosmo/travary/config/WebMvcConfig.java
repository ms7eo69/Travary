package com.kosmo.travary.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kosmo.travary.interceptor.AuthenticationInterceptor;
import com.kosmo.travary.model.CookieInfo;
import com.kosmo.travary.service.impl.member.MemberServiceImpl;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private CookieInfo cookieInfo;
	@Autowired
	private MemberServiceImpl memberService;

//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		  registry.addInterceptor(new AuthenticationInterceptor(cookieInfo,memberService))
//		  .addPathPatterns("/travary/**")
//		  .excludePathPatterns("/travary/member/**")
//		  .excludePathPatterns("/travary/before/**");
//	}
}
