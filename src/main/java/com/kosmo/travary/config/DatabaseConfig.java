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
		
		
		//TNS_ADMIN 변수 설정
		String projectDir = System.getProperty("user.dir");
        System.setProperty("TNS_ADMIN", projectDir + "/src/main/resources/wallet");
        
        hikariConfig.setMaximumPoolSize(20);	
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(id);
		hikariConfig.setPassword(password);
		hikariConfig.setAutoCommit(true);
		hikariConfig.setConnectionTimeout(3000);
		hikariConfig.setMaximumPoolSize(20);
//		hikariConfig.setValidationTimeout(3000);
//		hikariConfig.setMinimumIdle(5);
<<<<<<< Updated upstream
		hikariConfig.setMaximumPoolSize(20);
=======
>>>>>>> Stashed changes
//		hikariConfig.setIdleTimeout(200000);
//		hikariConfig.setMaxLifetime(240000);
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
