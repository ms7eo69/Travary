package com.kosmo.travary.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.ToString;

@Component
public class CookieInfo {

	@Value("${token_name}")
	private String tokenName;
	@Value("${key_name}")
	private String keyName;
	@Value("${id_name}")
	private String idName;

	public String getTokenName() {
		return tokenName;
	}

	public String getKeyName() {
		return keyName;
	}
	
	public String getIdName() {
		return idName;
	}
}
