package com.kosmo.travary.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(
		value = {"com.kosmo.travary.service.impl"},
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
			factoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/*.xml"));
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
