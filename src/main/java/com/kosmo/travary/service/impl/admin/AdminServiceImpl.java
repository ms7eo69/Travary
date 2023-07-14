package com.kosmo.travary.service.impl.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

@Service("adminService")
public class AdminServiceImpl implements DaoService {

	@Autowired
	private AdminMapper mapper;
	
	public Map<String, Integer> getGender() {
		return mapper.getGender();
	}

	@Override
	public List<Map> selectList(Map map) {
		return null;
	}

	@Override
	public Map selectOne(Map map) {
		return null;
	}

	@Override
	public int insert(Map map) {
		return 0;
	}

	@Override
	public int update(Map map) {
		return 0;
	}

	@Override
	public int delete(Map map) {
		return 0;
	}
}
