package com.kosmo.travary.service.impl.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;
import com.kosmo.travary.service.ListPagingData;

import javax.servlet.http.HttpServletRequest;

/*
 * ID 미 지정시 ID값은 소문자로 시작하는 클래스명
 * value속성으로 지정도 가능하다
 */
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
		return 0;
	}

	@Override
	public List<Map> selectList(Map map) {
		return null;
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
	public String getAccessToken(String authorize_code) throws Exception {
		return null;
	}



}
