package com.kosmo.travary.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.MoonSeongHyun2.board.service.BoardDTO;

@Mapper
public interface BoardMapper {

	//회원 여부 판단용
		boolean findByIdAndPwd(Map map);
		//전체 조회
		List findAll(Map map);
		//입력
		int save(Map map);
		//레코드 하나
		BoardDTO findByNo(Map map);
		//번호로 조회하여 레코드 하나 삭제
		int deleteByNo(BoardDTO record);
		//번호로 조회하여 레코드 하나 수정
		int updateByNo(BoardDTO record);
		//전체 래코드 수 조회
		int count(Map map);
}
