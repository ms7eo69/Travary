<<<<<<<< HEAD:src/main/java/com/kosmo/travary/service/impl/api/INaverLoginService.java
package com.kosmo.travary.service.impl.api;
========
package com.kosmo.travary.service.impl.apilogin;
>>>>>>>> feature/api:src/main/java/com/kosmo/travary/service/impl/apilogin/INaverLoginService.java

import java.util.HashMap;
import java.util.Map;

public interface INaverLoginService {
	String getAccessToken(String authorize_code) throws Throwable;

	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
}
