package com.kosmo.travary.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@Configuration
@PropertySource({
	"classpath:properties/database.properties",
	"classpath:properties/cookie.properties",
	"classpath:properties/naverkey.properties",
	"classpath:properties/api.properties"
})
public class PlaceHolderConfig {

	@Bean
	static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}
