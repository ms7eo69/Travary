package com.kosmo.travary.service.impl.api;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CertifiedPhoneNumber implements ICertifiedPhoneNumber{
	
	@Value("${SMS-ID}")
	private String smsId;
	@Value("${SMS-KEY}")
	private String smsKey;
	
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {

	  Message coolsms = new Message(smsId, smsKey);
	
	
	  HashMap<String, String> params = new HashMap<String, String>();
	  params.put("to", phoneNumber);    
	  params.put("from", "01049328643");   
	  params.put("type", "SMS");
	  params.put("text", "인증번호는"+"["+numStr+"]"+"입니다.");
	  params.put("app_version", "test app 1.2");
	
	  try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println("서비스에 들어옴?");
	      System.out.println(obj.toString());
	  } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	  }
	}		
}
