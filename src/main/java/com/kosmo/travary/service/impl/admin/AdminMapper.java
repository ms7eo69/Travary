package com.kosmo.travary.service.impl.admin;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	//성별조회
	Map getGender();
}
