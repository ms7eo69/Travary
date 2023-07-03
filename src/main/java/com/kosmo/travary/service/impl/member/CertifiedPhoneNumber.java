package com.kosmo.travary.service.impl.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CertifiedPhoneNumber {

	public static void certifiedPhoneNumber(String phoneNumber, String numStr) {
		 
	      String api_key = "";
		  String api_secret = "";
		  Message coolsms = new Message(api_key, api_secret);
		
		
		  HashMap<String, String> params = new HashMap<String, String>();
		  params.put("to", phoneNumber);    
		  params.put("from", "01049328643");   
		  params.put("type", "SMS");
		  params.put("text", "인증번호는"+"["+numStr+"]"+"입니다.");
		  params.put("app_version", "test app 1.2"); // application name and version
		
		  try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		  } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		  }
		}	
}
