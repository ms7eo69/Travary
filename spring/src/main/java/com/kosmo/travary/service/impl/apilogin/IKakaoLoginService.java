package com.kosmo.travary.service.impl.apilogin;

import java.util.HashMap;
import java.util.Map;

public interface IKakaoLoginService {

	String getAccessToken(String authorize_code) throws Throwable;

	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
}