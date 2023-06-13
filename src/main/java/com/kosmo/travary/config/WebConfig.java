package com.kosmo.travary.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	//기존 리소스 핸들러는 그대로 유지하며 원하는 리소스 핸들러만 추가가능
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/virtual/**")//spring.mvc.static-path-pattern=/static/**
						.addResourceLocations("classpath:/mystatic/");//spring.web.resources.static-location=classpath:/static
	}
}
