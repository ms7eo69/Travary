package com.kosmo.travary.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//어노테이션이 아닌 xml방식으로 쿼리 실행시
@Configuration
//@Mapper가 붙은 매퍼 인터페이스 스캔 
//(value={매퍼인터페이스들의 패키지...},sqlSessionFactoryRef="SqlSessionFactory빈의 ID")
@MapperScan(
		value = {"com.kosmo.travary.board.service.impl"},
		sqlSessionFactoryRef = "sqlSessionFactory")
public class MyBatisConfig {
	
	private final ApplicationContext applicationContext;
	public MyBatisConfig(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}

	@Bean
	SqlSessionFactory sqlSessionFactory(DataSource dataSource) {
		
		SqlSessionFactory factory =null;
		try {
			SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
			factoryBean.setDataSource(dataSource);
			factoryBean.setTypeAliasesPackage("com.kosmo.travary");
			factoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/**/*.xml"));
			factory = factoryBean.getObject();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return factory;
	};
	
	@Bean
	SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);				
	}
	
}
