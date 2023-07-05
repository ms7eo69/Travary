package com.kosmo.travary.service.impl.apilogin;

import java.util.HashMap;
import java.util.Map;

public interface INaverLoginService {
	String getAccessToken(String authorize_code) throws Throwable;

	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
}
