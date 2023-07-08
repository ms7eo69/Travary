package com.kosmo.travary;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TravaryApplication {

	public static void main(String[] args) {
		
		//TNS_ADMIN 변수 설정
		String projectDir = System.getProperty("user.dir");
        System.setProperty("TNS_ADMIN", projectDir + "/src/main/resources/wallet");
        
		SpringApplication.run(TravaryApplication.class, args);
	}

}
