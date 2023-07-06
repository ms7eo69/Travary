package com.kosmo.travary.service.impl.plan;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

@Service
public class PlanServiceImpl implements DaoService{

	@Autowired
	private PlanMapper mapper;
	
	@Override
	public List<Map> selectList(Map map) {
		return null;
	}

	@Override
	public Map selectOne(Map map) {
		return null;
	}

	public int select() {
		return mapper.find();
	}
	public int updateLastNum(Map map) {
		return mapper.updateLastNum(map);
	}
	@Override
	public int insert(Map map) {
		return mapper.saveByNo(map);
	}

	@Override
	public int update(Map map) {
		return 0;
	}

	@Override
	public int delete(Map map) {
		return 0;
	}
	public List<String> selectSregion() {
		return mapper.selectSregion();
	}
	public List<Map> selectByBoundary(Map map) {
		return mapper.selectByBoundary(map);
	}

	public Map selectMainPlace(String sregion) {
		return mapper.selectMainPlace(sregion);
	}

	// Search Trend
//	public List<String> selectfour(Map map){
//		return mapper.findFourByNo(map); 
//	}
}
