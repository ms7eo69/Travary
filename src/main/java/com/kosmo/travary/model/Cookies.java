package com.kosmo.travary.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	public static String getCookieValue(String name,HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie cookie : cookies) {
				if(name.equals(cookie.getName())) 
					return cookie.getValue();
			}
		}
		return null;
	}
	public static void createCookie(String name,String value,HttpServletResponse response,HttpServletRequest request,int expirationMinute) {
		Cookie cookie = new Cookie(name,value);
		cookie.setPath(request.getContextPath()+"/");
		cookie.setMaxAge(expirationMinute*60*1000);
		response.addCookie(cookie);
	}	
	public static void removeCookie(String name,HttpServletRequest request,HttpServletResponse response) {
		Cookie cookie = new Cookie(name,"");
		cookie.setPath(request.getContextPath()+"/");
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
	}
}
