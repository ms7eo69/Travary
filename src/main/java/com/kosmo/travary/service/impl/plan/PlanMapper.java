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
		List<String> selectLregion();
		
		//SearchTrend
		List<String> findFourByNo(Map map);
		
		//Plan
		List<Map> selectByBoundary(Map map);
		Map selectMainPlace(String sregion);
		int selectCountByBoundary(Map main);
		Map selectACMDByBoundary(Map main);
		Map selectByNo(Map map);
		List<Map> selectAnotherByBoundary(Map map);
		List<Map> selectList(Map map);
		
		//Admin
		List<Map> selectMarkersByBoundary(Map map);
		int insertBoundaryPinpoint(Map map);
		String selectBoundaryPinpoint(Map map);
		
		// 관리자 바운드리 설정페이지에서 지역 클릭시 마커/핀포인트 조회
		List<Map> selectBoundarysByLregion(Map map);
		List<Map> selectMarkersByLregion(Map map);
		
}
