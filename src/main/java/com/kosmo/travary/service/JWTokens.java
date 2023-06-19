package com.kosmo.travary.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JWTokens {
	
	private static String createSecretKey() {
		String result = "";
		for (int i = 0; i < 50; i++) {
			result += Character.toString(CustomUtility.getRandomInt(32, 126));
		}
		return result;
	}
	
	public static String createToken(String username,Map<String, Object> payloads,long expirationMinute) {

		String secretKey = createSecretKey();
		payloads.put(payloads.get("keyName").toString(), secretKey);
		//JWT 토큰의 만료 시간 설정
		long currentTimeMillis = System.currentTimeMillis();//토큰의 생성시간
		long expirationTime = currentTimeMillis + expirationMinute*60*1000; //토큰의 만료시간(1시간)

		//Header 부분 설정
		Map<String, Object> headers = new HashMap();
		headers.put("typ", "JWT");
		headers.put("alg", "HS256");

		JwtBuilder builder = Jwts.builder()
				.setHeader(headers)// Headers 설정
				.setClaims(payloads)// Claims 설정
				.setSubject(username)//사용자 ID 설정
				.setIssuedAt(new Date(currentTimeMillis))//생성 시간을 설정
				.setExpiration(new Date(expirationTime))//만료 시간 설정(필수로 설정하자.왜냐하면 토큰(문자열이라)은 세션처럼 제어가 안된다)
				.signWith(SignatureAlgorithm.HS256,secretKey.getBytes());//비밀 키로 JWT를 서명

		//JWT 생성
		String jwt = builder.compact();

		return jwt;
	}

public static String createToken(String username) {

		String secretKey = createSecretKey();
		
		//JWT 토큰의 만료 시간 설정
		long currentTimeMillis = System.currentTimeMillis();//토큰의 생성시간
		long expirationTime = currentTimeMillis + 1000*60*60; //토큰의 만료시간(1시간)

		//Header 부분 설정
		Map<String, Object> headers = new HashMap<>();
		headers.put("typ", "JWT");
		headers.put("alg", "HS256");

		Map<String,Object> payloads = new HashMap<>();
		JwtBuilder builder = Jwts.builder()
				.setHeader(headers)// Headers 설정
				.setClaims(payloads)// Claims 설정
				.setSubject(username)//사용자 ID 설정
				.setIssuedAt(new Date(currentTimeMillis))//생성 시간을 설정
				.setExpiration(new Date(expirationTime))//만료 시간 설정(필수로 설정하자.왜냐하면 토큰(문자열이라)은 세션처럼 제어가 안된다)
				.signWith(SignatureAlgorithm.HS256,secretKey.getBytes());//비밀 키로 JWT를 서명

		//JWT 생성
		String jwt = builder.compact();

		return jwt;
	}

	/**
	 * 발급한 토큰의 payloads부분을 반환하는 메소드
	 * @param token			발급된 토큰
	 * @param keyPath		비밀키가 기록된 .properties 파일의 경로 (단 , 확장자 생략)
	 * @param key				.properties파일의 주어진 키값. 예 : (키 = 비밀키) 일떄의 키값
	 * @return						토큰의 payloads부분 반환
	 */

	public static Map<String, Object> getTokenPayloads(String token,String secretKey) {

		Map<String, Object> claims = new HashMap<>();
		try {
			//JWT토큰 파싱 및 검증
			claims = Jwts.parser().parseClaimsJws(token).getBody();
			claims = Jwts.parser()
					.setSigningKey(secretKey.getBytes("UTF-8"))//서명한 비밀키 설정
					.parseClaimsJws(token)//주어진 JWT토큰과 비밀 키를 사용하여 JWT토큰을 검증하는 메소드로 실패시 예외를 발생시킨다
					.getBody();
			return claims;
		}
		catch (ExpiredJwtException e) { // 토큰이 만료되었을 경우
			claims.put("invalid","Validity period has expired");
		}
		catch (Exception e) {
			//검증에 실패하면 즉 유효하지 않은 토큰 false 반환
			claims.put("invalid","Invalid Token");
		}
		return claims;
	}/////////////////////////////////

	public static Map<String, Object> getTokenPayloads(String token,ServletContext context,String secretKey) {

		Map<String, Object> claims = new HashMap<>();
		try {
			//JWT토큰 파싱 및 검증
			claims = Jwts.parser()
					.setSigningKey(secretKey.getBytes("UTF-8"))//서명한 비밀키 설정
					.parseClaimsJws(token)//주어진 JWT토큰과 비밀 키를 사용하여 JWT토큰을 검증하는 메소드로 실패시 예외를 발생시킨다
					.getBody();
			return claims;
		}
		catch (ExpiredJwtException e) { // 토큰이 만료되었을 경우
			claims.put("invalid","Validity period has expired");
		}
		catch (Exception e) {
			//검증에 실패하면 즉 유효하지 않은 토큰 false 반환
			claims.put("invalid","Invalid Token");
		}
		return claims;
	}/////////////////////////////////
	/**
	 * 유효한 토큰인지 검증하는 메소드
	 * @param token			발급된 토큰
	 * @param keyPath		비밀키가 기록된 .properties 파일의 경로 (단 , 확장자 생략)
	 * @param key				.properties파일의 주어진 키값. 예 : (키 = 비밀키) 일떄의 키값
	 * @return						유효한 토큰이면 true,유효하지 않은 토큰이면 false 반환
	 */

	//JWT 토큰 검증용 메소드
	public static boolean verifyToken(String token,String secretKey) {

		Map<String, Object> claims = new HashMap<>();
		try {
			//JWT토큰 파싱 및 검증
			claims = Jwts.parser()
					.setSigningKey(secretKey.getBytes("UTF-8"))//서명한 비밀키 설정
					.parseClaimsJws(token)//주어진 JWT토큰과 비밀 키를 사용하여 JWT토큰을 검증하는 메소드로 실패시 예외를 발생시킨다
					.getBody();
		}
		catch (Exception e) {
			//검증에 실패하면 즉 유효하지 않은 토큰 false 반환
			return false;
		}
		return true;
	}/////////////////////////////////
	
	public static boolean verifyToken(String token,ServletContext context,String secretKey) {

		Map<String, Object> claims = new HashMap<>();
		try {
			//JWT토큰 파싱 및 검증
			claims = Jwts.parser()
					.setSigningKey(secretKey.getBytes("UTF-8"))//서명한 비밀키 설정
					.parseClaimsJws(token)//주어진 JWT토큰과 비밀 키를 사용하여 JWT토큰을 검증하는 메소드로 실패시 예외를 발생시킨다
					.getBody();
		}
		catch (Exception e) {
			//검증에 실패하면 즉 유효하지 않은 토큰 false 반환
			return false;
		}
		return true;
	}/////////////////////////

	/**
	 * 문자열인 발급된 토큰을 요청헤더의 쿠키에서 읽어오는 메소드
	 * @param request				토큰이 발급된 페이지의  request객체
	 * @param cookieName	토큰 발급시 설정한 쿠키명
	 * @return								발급된 토큰
	 */

	public static String getToken(HttpServletRequest request,String cookieName) {
		//발급한 토큰 가져오기
		Cookie[] cookies = request.getCookies();
		String token="";
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals(cookieName)){
					token = cookie.getValue();
				}
			}
		}
		return token;
	}

	/**
	 * 토큰을 삭제하는 메소드
	 * @param request		HttpServletRequest 객체
	 * @param response	HttpServletResponse 객체
	 */
	public static void  removeToken(HttpServletRequest request,HttpServletResponse response) {
		Cookie cookie = new Cookie(request.getServletContext().getInitParameter("TOKEN-NAME"),"");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}

	//토큰 만료시간 연장메소드
	//expiration:현재시간+연장시간
	public static String setTokenExpiration(String token,String secretKey, Date expiration) {

		String newToken=null;
		try{
			Claims claims = Jwts.parser()
	                .setSigningKey(secretKey.getBytes("UTF-8"))
	                .parseClaimsJws(token).getBody();

	        claims.setExpiration(expiration);

	        newToken = Jwts.builder()
	                .setClaims(claims)
	                .signWith(SignatureAlgorithm.HS256,secretKey.getBytes("UTF-8"))
	                .compact();
		}
		catch(Exception e){
			e.printStackTrace();
		}
        return newToken;
	}
}
