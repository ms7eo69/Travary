package com.kosmo.travary.service.impl.plan;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PlanMapper {

		boolean findByIdAndPwd(Map map);
		List findAll(Map map);
		int save(Map map);
		int saveKey(Map map);
		int saveByNo(Map map);
		Map findByNo(Map map);
		int find();
		int updateLastNum(Map map);
		int deleteByNo(Map map);
		int updateByNo(Map map);
		int count(Map map);
		List<String> selectSregion();
		
		//SearchTrend
		List<String> findFourByNo(Map map);
		
		//Plan
		List<Map> selectByBoundary(Map map);
		
}
