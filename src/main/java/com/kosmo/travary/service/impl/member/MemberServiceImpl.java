package com.kosmo.travary.service.impl.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.travary.service.DaoService;
import com.kosmo.travary.service.ListPagingData;

import javax.servlet.http.HttpServletRequest;

/*
 * ID 미 지정시 ID값은 소문자로 시작하는 클래스명
 * value속성으로 지정도 가능하다
 */
@Service("memberService")
public class MemberServiceImpl implements DaoService {

	//매퍼 인터페이스 주입
	@Autowired
	private MemberMapper mapper;
	

	/*
	 * @Override public ListPagingData<BoardDTO> selectList(Map map,
	 * HttpServletRequest req, int nowPage) {
	 * 
	 * //글 전체 목록 얻기 List records = mapper.findAll(map);
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

}
