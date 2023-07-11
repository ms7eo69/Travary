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
		return mapper.selectList(map);
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
	public List<String> selectLregion() {
		return mapper.selectLregion();
	}
	public List<Map> selectByBoundary(Map map) {
		return mapper.selectByBoundary(map);
	}

	public Map selectMainPlace(String sregion) {
		return mapper.selectMainPlace(sregion);
	}

	public int selectCountByBoundary(Map main) {
		return mapper.selectCountByBoundary(main);
	}

	public Map selectACMDByBoundary(Map main) {
		return mapper.selectACMDByBoundary(main);
	}

	public Map selectByNo(Map map) {
		return mapper.selectByNo(map);
	}

	public List<Map> selectAnotherByBoundary(Map map) {
		return mapper.selectAnotherByBoundary(map);
	}

	// Search Trend
//	public List<String> selectfour(Map map){
//		return mapper.findFourByNo(map); 
//	}
}
