package com.kosmo.travary.service.impl.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

		boolean findByIdAndPwd(Map map);
		List findAll(Map map);
		int save(Map map);
		int saveKey(Map map);
		Map findByNo(Map map);
		int deleteByNo(Map map);
		int updateByNo(Map map);
		int count(Map map);
		//카카오 로그인
		String getAccessToken(String authorize_code) throws Throwable;
		Map findById(Map map);
}
