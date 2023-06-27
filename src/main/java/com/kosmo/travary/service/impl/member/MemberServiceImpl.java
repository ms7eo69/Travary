package com.kosmo.travary.service.impl.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

@Service
public class MemberServiceImpl implements DaoService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int insert(Map map) {
		return mapper.save(map);
	}
	
	public int insertKey(Map map) {
		int affected = 0;
		try {
			affected = mapper.saveKey(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	@Override
	public int update(Map map) {
		return 0;
	}

	@Override
	public int delete(Map map) {
		return 0;
	}
	@Override
	public Map selectOne(Map map) {
		return mapper.findById(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return null;
	}
	
	public boolean isMember(Map map) {
		return mapper.findByIdAndPwd(map); 
	}

}
