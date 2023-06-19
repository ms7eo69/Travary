package com.kosmo.travary.service.impl.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

import javax.servlet.http.HttpServletRequest;

/*
 * ID 미 지정시 ID값은 소문자로 시작하는 클래스명
 * value속성으로 지정도 가능하다
 */
@Service
public class BoardServiceImpl implements DaoService {

	@Autowired
	private BoardMapper mapper;
	
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
	@Override
	public Map selectOne(Map map) {
		return null;
	}

	@Override
	public List<Map> selectList(Map map) {
		return mapper.findAll(map);
	}
}
