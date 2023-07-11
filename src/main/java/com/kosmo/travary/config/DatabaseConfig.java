package com.kosmo.travary.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class DatabaseConfig {

	@Value("${driver-class-name}")
	private String driver;
	@Value("${oracle-url}")
	private String url;
	@Value("${user}")
	private String id;
	@Value("${password}")
	private String password; 
	@Bean
	DataSource dataSource() {
		
		//HikariConfig객체 생성후 데이터베이스 연결 및 커넥션 풀 정보 설정
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName(driver);
		String projectDir = System.getProperty("user.dir");
        System.setProperty("TNS_ADMIN", projectDir + "/src/main/resources/wallet");
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(id);
		hikariConfig.setPassword(password);
		//해커리 커넥션 풀 관련 설정 추가
		//auto commit설정 기본값(true)
		hikariConfig.setAutoCommit(true);
		/*
		 * 커넥션 풀에 최대 커넥션 수. (기본값: 10) 
		 * IDLE상태에 있는 커넥션이 없을 때 
		 * connection-timeout이 지날 때까지
		 * getConnection() 호출은 블록킹된다
		 */
		hikariConfig.setConnectionTimeout(30000);
	
		//DataSource를 상속받은 HikariDataSource객체 반환
		return new HikariDataSource(hikariConfig);
	}
	
	//트랜젝션 처리를 위한 빈 등록
	//트랜잭션 관리자 객체
	@Bean
	DataSourceTransactionManager transactionManager (HikariDataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}
	//트랜잭션 관리자 객체를 TransactionTemplate의 트랜잭션 관리자를 설정
	//transactionTemplate으로 서비스단에서 트랜잭션 처리한다.
	@Bean
	TransactionTemplate transactionTemplate(DataSourceTransactionManager transactionManager) {
		TransactionTemplate  transactionTemplate = new TransactionTemplate();
		transactionTemplate.setTransactionManager(transactionManager);
		return transactionTemplate;
	}
}
