package com.kosmo.travary.service.impl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

@Service("boardService")
public class BoardServiceImpl implements DaoService {

	@Autowired
	private BoardMapper mapper;
	
	/*
	 * @Override public ListPagingData<BoardDTO> selectList(Map map,
	 * HttpServletRequest req, int nowPage) {
	 * 
	 * List records = mapper.findAll(map);
	 * 
	 * ListPagingData<BoardDTO> listPagingData = ListPagingData.builder()
	 * .records(records) .build(); return listPagingData; }
	 */

	@Override
	public int insert(Map map) {
		return mapper.save(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return mapper.findAll(map);
	}
	
	@Override
	public Map selectOne(Map map) {
		return mapper.findByNo(map);
	}

	@Override
	public int update(Map map) {
		return mapper.updateByNo(map);
	}

	@Override
	public int delete(Map map) {
		return mapper.deleteByNo(map);
	}

	public List<Map> alladmininfo(Map map) {
		return mapper.findAll_Admin(map);
	}

	

}
