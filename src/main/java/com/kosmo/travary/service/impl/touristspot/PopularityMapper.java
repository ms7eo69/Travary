package com.kosmo.travary.service.impl.touristspot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PopularityMapper {

		boolean findByIdAndPwd(Map map);
		List findAll(Map map);
		List<String> findFourByNo(Map map);
		int save(Map map);
		int saveKey(Map map);
		int saveByNo(Map map);
		Map findByNo(Map map);
		int find();
		int updateLastNum(Map map);
		int deleteByNo(Map map);
		int updateByNo(Map map);
		int count(Map map);

}
