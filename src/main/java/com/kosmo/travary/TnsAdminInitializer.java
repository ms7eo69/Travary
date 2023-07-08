package com.kosmo.travary;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

@Component
public class TnsAdminInitializer {

	 @PostConstruct
	    public void initializeTnsAdmin() {
	        String projectDir = System.getProperty("user.dir");
	        System.setProperty("TNS_ADMIN", projectDir + "/src/main/resources/wallet");
	    }
}
