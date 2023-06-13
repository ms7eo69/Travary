package com.kosmo.travary.board.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.MoonSeongHyun2.board.service.BoardDTO;
import com.project.MoonSeongHyun2.board.service.BoardService;
import com.project.MoonSeongHyun2.board.service.ListPagingData;

import jakarta.servlet.http.HttpServletRequest;

/*
 * ID 미 지정시 ID값은 소문자로 시작하는 클래스명
 * value속성으로 지정도 가능하다
 */
@Service("boardService")
public class BoardServiceImpl implements BoardService<BoardDTO> {

	//매퍼 인터페이스 주입
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public boolean isLogin(Map map) {
		return mapper.findByIdAndPwd(map);
	}
	
	/*
	 *  첫번째 인자 Map : 
	 *  	검색 안하면 빈 맵, 검색시에는 검색어와 검색 컬럼명이 저장
	 *  두번째 인자 req :
	 *  	컨텍스트 패스를 얻기 위함(페이징시 절대경로 지정)
	 *  세번째 인자 nowPage :
	 *  	현재 페이지 번호
	 */
	@Override
	public ListPagingData<BoardDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		
		//글 전체 목록 얻기
		List records =  mapper.findAll(map);
		
		ListPagingData<BoardDTO> listPagingData = ListPagingData.builder()
																											.records(records)
																											.build();
		return listPagingData;
	}

	@Override
	public BoardDTO selectOne(Map map) {
		return null;
	}

	@Override
	public int insert(Map map) {
		return 0;
	}

	@Override
	public int update(BoardDTO record) {
		return 0;
	}

	@Override
	public int delete(BoardDTO record) {
		return 0;
	}

}
